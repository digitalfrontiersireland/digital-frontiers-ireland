(*
 * This software is distributed under BSD license.
 *
 * Copyright (c) 2009 Iztok Kacin, Cromis (iztok.kacin@gmail.com).
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * - Neither the name of the Iztok Kacin nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without specific
 *   prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * =============================================================================
 * Fast IMC client server communication based on Indy TCP. Very lightweight.
 * =============================================================================
 * 01/04/2012 (1.0.0)
 *   - Initial implementation
 * 01/04/2012 (1.1.0)
 *   - Optimized the code for speed
 *   - Restructured some of the code and some of the procedures and properties
 *   - Added execute timeouts, to both server and client
 * 07/04/2012 (1.1.1)
 *   - Code optimizations
 *   - Execute timeout for server
 *   - ErroDesc for client
 * 14/05/2012 (1.1.2)
 *   - Same code syntax as in IPC
 * 22/05/2012 (1.1.3)
 *   - Added IsConnected property
 * =============================================================================
*)
unit Cromis.IMC;

interface

uses
  Windows, SysUtils, Classes, DateUtils, 

  // Indy units
  IdContext, IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer,
  IdTCPClient, IdGlobal,

  // cromis units
  Cromis.Streams, Cromis.StringUtils;

const
  cBufferSize = 65536;

const
  cDefaultTimeout = 10000;

const
  cInitialPoolSize = 20;

type
  IIMCData = IMessageData;

type
  TOnExecuteRequest = procedure(const Request, Response: IMessageData) of Object;

  TIMCServer = class
  private
    FTCPServer: TIdTCPServer;
    FExecuteTimeout: Cardinal;
    FOnExecuteRequest: TOnExecuteRequest;
    function GetListening: Boolean;
    function GetServerPort: Integer;
    function GetMinPoolSize: Integer;
    procedure SetServerPort(const Value: Integer);
    procedure SetMinPoolSize(const Value: Integer);
    procedure OnServerExecute(AContext: TIdContext);
  public
    procedure Stop;
    procedure Start;
    procedure Restart;
    constructor Create;
    destructor Destroy; override;
    property Listening: Boolean read GetListening;
    property ServerPort: Integer read GetServerPort write SetServerPort;
    property MinPoolSize: Integer read GetMinPoolSize write SetMinPoolSize;
    property ExecuteTimeout: Cardinal read FExecuteTimeout write FExecuteTimeout;
    property OnExecuteRequest: TOnExecuteRequest read FOnExecuteRequest write FOnExecuteRequest;
  end;

  TIMCClient = class
  private
    FErrorDesc: string;
    FLastError: Cardinal;
    FTCPClient: TIdTCPClient;
    FAnswerValid: Boolean;
    FIsConnected: Boolean;
    FServerAddress: string;
    FExecuteTimeout: Cardinal;
    procedure SetServerAddress(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure ConnectClient(const ConnectTimeout: Cardinal = cDefaultTimeout);
    function ExecuteConnectedRequest(const Request: IMessageData): IMessageData; overload;
    function ExecuteRequest(const Request: IMessageData; const ConnectTimeout: Cardinal = cDefaultTimeout): IMessageData;
    procedure DisconnectClient;
    property ExecuteTimeout: Cardinal read FExecuteTimeout write FExecuteTimeout;
    property ServerAddress: string read FServerAddress write SetServerAddress;
    property AnswerValid: Boolean read FAnswerValid;
    property IsConnected: Boolean read FIsConnected;
    property LastError: Cardinal read FLastError;
    property ErrorDesc: string read FErrorDesc;
  end;

  function AcquireIMCData: IMessageData;

implementation

function AcquireIMCData: IMessageData;
begin
  Result := TMessageData.Create;
end;

{ TIMCServer }

constructor TIMCServer.Create;
begin
  FTCPServer := TIdTCPServer.Create(nil);
  FTCPServer.ListenQueue := cInitialPoolSize;
  FTCPServer.OnExecute := OnServerExecute;
  FExecuteTimeout := 60000;
end;

destructor TIMCServer.Destroy;
begin
  Stop;
  FreeAndNil(FTCPServer);

  inherited;
end;

function TIMCServer.GetListening: Boolean;
begin
  Result := FTCPServer.Active;
end;

function TIMCServer.GetMinPoolSize: Integer;
begin
  Result := FTCPServer.ListenQueue;
end;

function TIMCServer.GetServerPort: Integer;
begin
  Result := FTCPServer.DefaultPort;
end;

procedure TIMCServer.OnServerExecute(AContext: TIdContext);
var
  Request: IMessageData;
  Response: IMessageData;
  StartTime: TDateTime;
  DataLength: Int64;
  FullDataSize: Int64;
  IDAsBytes: TIdBytes;
  IDAsString: string;
  OldReadTimeout: Integer;
begin
  with AContext.Connection.IOHandler do
  begin
    OldReadTimeout := ReadTimeout;
    try
      StartTime := Now;
      ReadTimeout := FExecuteTimeout;
      //read the data length of the comming response
      FullDataSize := ReadInt64;
    finally
      ReadTimeout := OldReadTimeout;
    end;

    // wait for all data to arrive
    while (MilliSecondsBetween(Now, StartTime) < FExecuteTimeout) and
          (InputBuffer.Size < FullDataSize) do
    begin
      CheckForDataOnSource(50);
      CheckForDisconnect(True);
    end;

    // check if we failed to get all the data
    if InputBuffer.Size < FullDataSize then
    begin
      AContext.Connection.Disconnect;
      InputBuffer.Clear;
      Exit;  
    end;

    // Acquire the data objects
    Request := AcquireIMCData;
    Response := AcquireIMCData;

    // read the message ID
    DataLength := ReadInt64;
    ReadBytes(IDAsBytes, DataLength);
    SetLength(IDAsString, DataLength div SizeOf(Char));
    Move(IDAsBytes[0], IDAsString[1], DataLength);    
    Request.ID := IDAsString;
     
    // read the message data
    DataLength := ReadInt64;
    ReadStream(Request.Data.Storage, DataLength, False);

    Request.Data.Storage.Seek(0, soFromBeginning);
    try
      // execute the actual request handler
      FOnExecuteRequest(Request, Response);
    finally
      // write the data stream to TCP
      Response.Data.Storage.Seek(0, soFromBeginning);
      DataLength := Length(Response.ID) * SizeOf(Char);
      FullDataSize := DataLength + Response.Data.Storage.Size + 2 * SizeOf(Int64);

      // write ID as binary data  
      SetLength(IDAsBytes, DataLength);
      Move(Response.ID[1], IDAsBytes[0], DataLength);

      // write data        
      Write(FullDataSize);
      Write(DataLength);
      Write(IDAsBytes);
      Write(Response.Data.Storage.Size);
      Write(Response.Data.Storage, Response.Data.Storage.Size);
    end;
  end;
end;

procedure TIMCServer.Restart;
begin
  Stop;
  Start;
end;

procedure TIMCServer.SetMinPoolSize(const Value: Integer);
begin
  FTCPServer.ListenQueue := Value;
end;

procedure TIMCServer.SetServerPort(const Value: Integer);
begin
  FTCPServer.DefaultPort := Value;
end;

procedure TIMCServer.Start;
begin
  if not Assigned(FOnExecuteRequest) then
    raise Exception.Create('OnExecuteRequest not assigned');

  FTCPServer.Active := True;
end;

procedure TIMCServer.Stop;
begin
  if FTCPServer.Active then
    FTCPServer.Active := False;
end;

{ TIMCClient }

constructor TIMCClient.Create;
begin
  FTCPClient := TIdTCPClient.Create(nil);
  FExecuteTimeout := 60000;
end;

destructor TIMCClient.Destroy;
begin
  DisconnectClient;
  FreeAndNil(FTCPClient);

  inherited;
end;

procedure TIMCClient.ConnectClient(const ConnectTimeout: Cardinal);
begin
  FIsConnected := False;

  if Trim(FServerAddress) = '' then
    raise Exception.Create('Server address is not defined!');

  // set host IP and host port
  FTCPClient.Host := StrBefore(':', FServerAddress);
  FTCPClient.Port := StrToInt(StrAfter(':', FServerAddress));

  FTCPClient.ConnectTimeout := ConnectTimeout;
  FTCPClient.Connect;

  // set if we are connected or not
  FIsConnected := FTCPClient.Connected;
end;

procedure TIMCClient.DisconnectClient;
begin
  if FTCPClient.Connected then
  begin
    FTCPClient.Disconnect;
    FIsConnected := False;
  end;
end;

function TIMCClient.ExecuteRequest(const Request: IMessageData;
                                   const ConnectTimeout: Cardinal
                                   ): IMessageData;
begin
  ConnectClient(ConnectTimeout);
  try
    Result := ExecuteConnectedRequest(Request);
  finally
    DisconnectClient;
  end;
end;

function TIMCClient.ExecuteConnectedRequest(const Request: IMessageData): IMessageData;
var
  StartTime: TDateTime;
  DataLength: Int64;
  FullDataSize: Int64;
  IDAsBytes: TIdBytes;
  IDAsString: string;
  OldReadTimeout: Integer;
begin
  Result := AcquireIMCData;
  FAnswerValid := False;

  with FTCPClient.IOHandler do
  begin
    Request.Data.Storage.Seek(0, soFromBeginning);
    DataLength := Length(Request.ID) * SizeOf(Char);
    FullDataSize := DataLength + Request.Data.Storage.Size + 2 * SizeOf(Int64);

    SetLength(IDAsBytes, DataLength);
    Move(Request.ID[1], IDAsBytes[0], DataLength);

    // write data
    Write(FullDataSize);
    Write(DataLength);
    Write(IDAsBytes);
    Write(Request.Data.Storage.Size);
    Write(Request.Data.Storage, Request.Data.Storage.Size);

    OldReadTimeout := ReadTimeout;
    try
      StartTime := Now;
      ReadTimeout := FExecuteTimeout;
      //read the data length of the comming response
      FullDataSize := ReadInt64;
    finally
      ReadTimeout := OldReadTimeout;
    end;

    // wait for all data to arrive
    while (MilliSecondsBetween(Now, StartTime) < FExecuteTimeout) and
          (InputBuffer.Size < FullDataSize) do
    begin
      CheckForDataOnSource(50);
      CheckForDisconnect(True);
    end;

    // check if we failed to get all the data
    if InputBuffer.Size < FullDataSize then
    begin
      FErrorDesc := 'Execute timeout! Server failed to respond in time.';
      FLastError := FTCPClient.LastCmdResult.NumericCode;
      InputBuffer.Clear;
      Exit;
    end;
    
    // read the message ID
    SetLength(IDAsBytes, 0);
    DataLength := ReadInt64;
    ReadBytes(IDAsBytes, DataLength);
    SetLength(IDAsString, DataLength div SizeOf(Char));
    Move(IDAsBytes[0], IDAsString[1], DataLength);
    Result.ID := IDAsString;

    // read the message data
    DataLength := ReadInt64;
    ReadStream(Result.Data.Storage, DataLength, False);
    Result.Data.Storage.Seek(0, soFromBeginning);

    // we were succesfull
    FAnswerValid := True;
  end;
end;

procedure TIMCClient.SetServerAddress(const Value: string);
begin
  FServerAddress := Value;
end;

end.
