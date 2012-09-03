program PackageTest;

uses
  Vcl.Forms,
  uPackageTestMain in 'uPackageTestMain.pas' {frmListView},
  ufraListView in '..\..\..\packages\ufraListView.pas' {fraListView: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmListView, frmListView);
  Application.Run;
end.
