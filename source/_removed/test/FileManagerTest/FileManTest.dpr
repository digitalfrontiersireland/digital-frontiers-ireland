program FileManTest;

uses
  FastMM4,
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uFraFileListView in '..\..\..\packages\uFraFileListView.pas' {Frame2: TFrame},
  ufraListView in '..\..\..\packages\ufraListView.pas' {fraListView: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
