unit ufraCompanyInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, JvExExtCtrls, JvImage, JvExForms, JvCustomItemViewer,
  Vcl.ExtDlgs, Vcl.ActnList,
  Vcl.Menus, JvBaseThumbnail, JvThumbViews, Vcl.ComCtrls;

type
  TfraCompanyInfo = class(TFrame)
    GroupBox1: TGroupBox;
    ebCompanyName: TLabeledEdit;
    ebSlogan: TLabeledEdit;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnClear: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    ActionList: TActionList;
    actAddFile: TAction;
    mnuAdd: TPopupMenu;
    actAddPicture1: TMenuItem;
    actClearPictures: TAction;
    actRemove: TAction;
    JvThumbView: TJvThumbView;
    mnuRemove: TPopupMenu;
    Remove1: TMenuItem;
    TrackBarW: TTrackBar;
    TrackBarH: TTrackBar;
    ProgressBar: TProgressBar;
    procedure actAddFileExecute(Sender: TObject);
    procedure actClearPicturesExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure TrackBarWChange(Sender: TObject);
    procedure JvThumbViewResize(Sender: TObject);
    procedure JvThumbViewStartScanning(Sender: TObject; Max: Integer);
    procedure JvThumbViewStopScanning(Sender: TObject);
    procedure JvThumbViewScanProgress(Sender: TObject; Position: Integer;
      var Stop: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

USES FileCtrl;
{$R *.dfm}

procedure TfraCompanyInfo.actAddFileExecute(Sender: TObject);
Var
  i: Integer;
begin
  if OpenPictureDialog.Execute(Self.Handle) then
  Begin
    ProgressBar.Visible := True;
    ProgressBar.Max := OpenPictureDialog.Files.Count - 1;
    for i := 0 to OpenPictureDialog.Files.Count - 1 do
    begin
      JvThumbView.AddFromFile(OpenPictureDialog.Files.Strings[i]);
      ProgressBar.Position := i;
    End;
    actRemove.Enabled := True;
    actClearPictures.Enabled := True;

    TrackBarW.Visible := True;
    TrackBarH.Visible := True;
    ProgressBar.Visible := False;
  End;
end;

procedure TfraCompanyInfo.actClearPicturesExecute(Sender: TObject);
begin
  JvThumbView.EmptyList;
  actRemove.Enabled := False;
  actClearPictures.Enabled := False;
  TrackBarW.Visible := False;
  TrackBarH.Visible := False;
end;

procedure TfraCompanyInfo.actRemoveExecute(Sender: TObject);
begin
  if JvThumbView.Selected > -1 then
  Begin
    JvThumbView.Delete(JvThumbView.Selected);
  End;
  if JvThumbView.Count > 0 then
  Begin
    actClearPictures.Enabled := True;
    actRemove.Enabled := True;
  End
  ELSE
  Begin
    actClearPictures.Enabled := False;
    actRemove.Enabled := False;
  End;
end;

procedure TfraCompanyInfo.JvThumbViewResize(Sender: TObject);
begin
  TrackBarW.Position := JvThumbView.MaxWidth;
  TrackBarH.Position := JvThumbView.MaxHeight;
end;

procedure TfraCompanyInfo.JvThumbViewScanProgress(Sender: TObject;
  Position: Integer; var Stop: Boolean);
begin
  ProgressBar.Position := Position;
end;

procedure TfraCompanyInfo.JvThumbViewStartScanning(Sender: TObject;
  Max: Integer);
begin
  ProgressBar.Max := Max;
  ProgressBar.Visible := True;

end;

procedure TfraCompanyInfo.JvThumbViewStopScanning(Sender: TObject);
begin
  ProgressBar.Visible := False;
end;

procedure TfraCompanyInfo.TrackBarWChange(Sender: TObject);
begin
  Self.JvThumbView.MaxWidth := TrackBarW.Position;
  Self.JvThumbView.MaxHeight := TrackBarH.Position;
end;

end.
