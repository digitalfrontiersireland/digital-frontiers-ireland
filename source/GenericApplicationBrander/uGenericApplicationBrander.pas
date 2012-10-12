unit uGenericApplicationBrander;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvWizard, JvWizardRouteMapSteps,
  JvExControls, ufraCompanyInfo, Vcl.Menus, Vcl.StdCtrls, ufraCompanyContactInfo,
  ufraCompanyLiveData, ufraCompanySaveData, ufraCopyFiles;

type
  TfrmRebrand = class(TForm)
    JvWizard: TJvWizard;
    JvWizardRouteMapSteps1: TJvWizardRouteMapSteps;
    JvWizardInteriorPage1: TJvWizardInteriorPage;
    fraCompanyInfo: TfraCompanyInfo;
    JvWizardInteriorPage2: TJvWizardInteriorPage;
    JvWizardInteriorPage3: TJvWizardInteriorPage;
    fraCompanyLiveData: TfraCompanyLiveData;
    JvWizardInteriorPage4: TJvWizardInteriorPage;
    fraCompanySaveData: TfraCompanySaveData;
    JvWizardInteriorPage5: TJvWizardInteriorPage;
    fraCopyFiles: TfraCopyFiles;
    fraCompanyContactInfo: TfraCompanyContactInfo;
    procedure fraCompanyInfo1btnClearClick(Sender: TObject);
    procedure fraCompanyInfo1actAddFileExecute(Sender: TObject);
    procedure fraCompanySaveData1btnFindClick(Sender: TObject);
    procedure fraCopyFilesbtnBeginClick(Sender: TObject);
    procedure fraCopyFilesbtnStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRebrand: TfrmRebrand;

implementation

{$R *.dfm}

procedure TfrmRebrand.fraCompanyInfo1actAddFileExecute(Sender: TObject);
begin
  fraCompanyInfo.actAddFileExecute(Sender);

end;

procedure TfrmRebrand.fraCompanyInfo1btnClearClick(Sender: TObject);
begin
  fraCompanyInfo.actClearPicturesExecute(Sender);

end;

procedure TfrmRebrand.fraCompanySaveData1btnFindClick(Sender: TObject);
begin
  fraCompanySaveData.btnFindClick(Sender);
  self.fraCopyFiles.ebDestination.Text := fraCompanySaveData.ebFolder.Text;
  fraCopyFiles.SimpleFileCopy.Destination := fraCompanySaveData.ebFolder.Text;

end;

procedure TfrmRebrand.fraCopyFilesbtnBeginClick(Sender: TObject);
begin
// Disable wizard controls when started
  fraCopyFiles.actStartExecute(Sender);


end;

procedure TfrmRebrand.fraCopyFilesbtnStopClick(Sender: TObject);
begin
self.fraCopyFiles.btnStop.Click;

end;

END.
