program GenericApplicationBrander;

uses
  VCL.Forms,
  uGenericApplicationBrander in 'uGenericApplicationBrander.pas' {frmRebrand},
  ufraCompanyInfo in '..\..\packages\GenericApplicationBranderPackages\ufraCompanyInfo.pas' {fraCompanyInfo: TFrame},
  ufraCompanyContactInfo in '..\..\packages\GenericApplicationBranderPackages\ufraCompanyContactInfo.pas' {fraCompanyContactInfo: TFrame},
  ufraCompanyLiveData in '..\..\packages\GenericApplicationBranderPackages\ufraCompanyLiveData.pas' {fraCompanyLiveData: TFrame},
  ufraCompanySaveData in '..\..\packages\GenericApplicationBranderPackages\ufraCompanySaveData.pas' {fraCompanySaveData: TFrame},
  ufraCopyFiles in '..\..\packages\GenericApplicationBranderPackages\ufraCopyFiles.pas' {fraCopyFiles: TFrame},
  ufrmCompanyContactAddPhone in '..\..\packages\GenericApplicationBranderPackages\ufrmCompanyContactAddPhone.pas' {frmCustomerContactAddPhone},
  udlgBusy in '..\..\packages\GenericApplicationBranderPackages\udlgBusy.pas' {dlgBusy},
  ufraBusy in '..\..\packages\GenericApplicationBranderPackages\ufraBusy.pas' {fraBusy: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRebrand, frmRebrand);
  Application.CreateForm(TfrmCustomerContactAddPhone, frmCustomerContactAddPhone);
  Application.CreateForm(TdlgBusy, dlgBusy);
  application.Run;

end.
