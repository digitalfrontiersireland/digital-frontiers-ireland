unit IMC.Client.Main;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls,

  // cromis units
  Cromis.IMC;

type
  TfMain = class(TForm)
    ListBox1: TListBox;
    lbServerAddress: TLabel;
    eServerAddress: TEdit;
    btnSend: TButton;
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btnSendClick(Sender: TObject);
var
  Result: IIMCData;
  Request: IIMCData;
  IMCClient: TIMCClient;
  TimeStamp: TDateTime;
begin
  IMCClient := TIMCClient.Create;
  try
    IMCClient.ServerAddress := eServerAddress.Text;
    IMCClient.ConnectClient;
    try
      if IMCClient.IsConnected then
      begin
        Request := AcquireIMCData;
        Request.ID := DateTimeToStr(Now);
        Request.Data.WriteUTF8String('Command', 'Synchronous');
        Result := IMCClient.ExecuteConnectedRequest(Request);

        if IMCClient.AnswerValid then
        begin
          TimeStamp := Result.Data.ReadDateTime('TDateTime');
          ListBox1.Items.Add(Format('Synchronous Response with ID: %s', [Result.ID]));
          ListBox1.Items.Add(Format('Response: TDateTime [%s]', [DateTimeToStr(TimeStamp)]));
          ListBox1.Items.Add(Format('Response: Integer [%d]', [Result.Data.ReadInteger('Integer')]));
          ListBox1.Items.Add(Format('Response: Real [%f]', [Result.Data.ReadReal('Real')]));
          ListBox1.Items.Add(Format('Response: String [%s]', [Result.Data.ReadUTF8String('String')]));
          ListBox1.Items.Add('-----------------------------------------------------------');
        end;
      end;

      if IMCClient.LastError <> 0 then
        ListBox1.Items.Add(Format('Error: Code %d', [IMCClient.LastError]));
    finally
      IMCClient.DisconnectClient;
    end;
  finally
    IMCClient.Free;
  end;
end;

end.
