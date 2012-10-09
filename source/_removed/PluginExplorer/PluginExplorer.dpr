// JCL_DEBUG_EXPERT_GENERATEJDBG ON
program PluginExplorer;

uses
  FastMM4,
  Vcl.Forms,
  uManager in 'uManager.pas' {Form2},
  ufraVisualPluginLoader in '..\..\packages\ufraVisualPluginLoader.pas' {Frame1: TFrame},
  ufraPluginListView in '..\..\packages\ufraPluginListView.pas' {fraPluginListView: TFrame};

{$R *.res}


begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfraPluginListView, fraPluginListView);
  Application.Run;
end.
