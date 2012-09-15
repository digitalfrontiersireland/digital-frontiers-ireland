unit IMC.Server.Main;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls,

  // cromis units
  Cromis.IMC;

type
  TfMain = class(TForm)
    ListBox1: TListBox;
    eServerPort: TEdit;
    btnStart: TButton;
    lbServerPort: TLabel;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FRequestCount: Int64;
    FIMCServer: TIMCServer;
    procedure OnExecuteRequest(const Request, Response: IIMCData);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btnStartClick(Sender: TObject);
begin
  if FIMCServer.Listening then
  begin
    btnStart.Caption := 'Start';
    FIMCServer.Stop;
  end
  else
  begin
    FIMCServer.ServerPort := StrToInt(eServerPort.Text);
    btnStart.Caption := 'Stop';
    FIMCServer.Start;
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  FIMCServer := TIMCServer.Create;
  FIMCServer.OnExecuteRequest := OnExecuteRequest;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FIMCServer);
end;

procedure TfMain.OnExecuteRequest(const Request, Response: IIMCData);
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
