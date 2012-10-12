unit ufraCompanySaveData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, JvBaseDlg, JvSelectDirectory;

type
  TfraCompanySaveData = class(TFrame)
    GroupBox1: TGroupBox;
    ebFolder: TLabeledEdit;
    btnFind: TButton;
    SelectDirectory: TJvSelectDirectory;
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraCompanySaveData.btnFindClick(Sender: TObject);
begin
if SelectDirectory.Execute then
   Begin
     self.ebFolder.Text := SelectDirectory.Directory;
   End;
end;

end.
