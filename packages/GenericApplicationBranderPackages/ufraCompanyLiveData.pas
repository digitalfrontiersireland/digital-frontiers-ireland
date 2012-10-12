unit ufraCompanyLiveData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfraCompanyLiveData = class(TFrame)
    ListView: TListView;
    Panel1: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnClear: TButton;
    procedure btnRemoveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraCompanyLiveData.btnClearClick(Sender: TObject);
begin
ListView.Clear;
end;

procedure TfraCompanyLiveData.btnRemoveClick(Sender: TObject);
begin
if ListView.SelCount > 0 then
   Begin
     ListView.Selected.Delete;
   End;
end;

end.
