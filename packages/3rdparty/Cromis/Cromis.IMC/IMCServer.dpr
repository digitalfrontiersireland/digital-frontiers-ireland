program IMCServer;

uses
  Forms,
  IMC.Server.Main in 'IMC.Server.Main.pas' {fMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
