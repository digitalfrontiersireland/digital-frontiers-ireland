program PluginExplorer;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  ufraVisualPluginLoader in '..\..\packages\ufraVisualPluginLoader.pas' {Frame1: TFrame},
  uManager in 'uManager.pas' {Form2},
  ufraPluginListView in '..\..\packages\ufraPluginListView.pas' {fraPluginListView: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
