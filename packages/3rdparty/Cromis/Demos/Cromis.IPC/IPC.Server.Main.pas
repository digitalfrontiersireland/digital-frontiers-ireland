unit IPC.Server.Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls,

  // cromis
  Cromis.IPC;

type
  TfMain = class(TForm)
    eServerName: TEdit;
    ListBox1: TListBox;
    btnStart: TButton;
    lbServerName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRequestCount: Int64;
    FIPCServer: TIPCServer;
    procedure OnExecuteRequest(const Request, Response: IIPCData);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btnStartClick(Sender: TObject);
begin
  FIPCServer.ServerName := eServerName.Text;

  if FIPCServer.Listening then
  begin
    btnStart.Caption := 'Start';
    FIPCServer.Stop;
  end
  else
  begin
    btnStart.Caption := 'Stop';
    FIPCServer.Start;
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  FIPCServer := TIPCServer.Create;
  FIPCServer.OnExecuteRequest := OnExecuteRequest;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FIPCServer);
end;

procedure TfMain.OnExecuteRequest(const Request, Response: IIPCData);
var
  Command: AnsiString;
begin
  Command := Request.Data.ReadUTF8String('Command');
  ListBox1.Items.Add(Format('%s Request Recieved (Sent at: %s)', [Command, Request.ID]));
  Inc(FRequestCount);

  Response.ID := Format('Response nr. %d', [FRequestCount]);
  Response.Data.WriteDateTime('TDateTime', Now);
  Response.Data.WriteInteger('Integer', 5);
  Response.Data.WriteReal('Real', 5.33);
  Response.Data.WriteUTF8String('String', 'to je testni string');
  Caption := Format('%d requests processed', [FRequestCount]);
end;

end.
