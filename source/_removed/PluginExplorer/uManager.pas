unit uManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraPluginListView, Vcl.Menus;

type
  TForm2 = class(TForm)
    fraPluginListView1: TfraPluginListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraPluginListView1actAddPluginExecute(Sender: TObject);
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

procedure TForm2.fraPluginListView1actAddPluginExecute(Sender: TObject);
begin
  fraPluginListView1.actAddPluginExecute(Sender);

end;

end.
