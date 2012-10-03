unit uManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraPluginListView, Vcl.Menus;

type
  TForm2 = class(TForm)
    fraPluginListView1: TfraPluginListView;
    Add1: TMenuItem;
    LoadAll1: TMenuItem;
    UnloadAll1: TMenuItem;
    UnloadPlugin1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FRAPLUGINLISTVIEW1.fraListView.ListView.Clear;
SELF.fraPluginListView1.PluginManager.ClearDlls;
end;

end.
