unit uPackageTestMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraListView, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.Ribbon, Vcl.ActnList, Vcl.RibbonLunaStyleActnCtrls;

type
  TfrmListView = class(TForm)
    fraListView: TfraListView;
    Ribbon: TRibbon;
    rpOptions: TRibbonPage;
    ActionManager: TActionManager;
    rpItems: TRibbonPage;
    rgViewStyle: TRibbonGroup;
    rgBehavour: TRibbonGroup;
    rgNavigate: TRibbonGroup;
    rgSelect: TRibbonGroup;
    rgViewOptions: TRibbonGroup;
    rgGroups: TRibbonGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListView: TfrmListView;

implementation

{$R *.dfm}

procedure TfrmListView.FormCreate(Sender: TObject);
vAR
  aGroupInfo : TGroupInfoRec;
  ListItemInfo : TListItemInfoRec;
  list : tstringlist;
begin
Ribbon.Caption := Caption;


list := tstringlist.Create;
list.Add('1');
list.Add('2');
list.Add('3');
list.Add('4');
list.Add('5');


Self.fraListView.AddColumns(list,true,taleftjustify,true,0,300,0,0);

aGroupInfo.Header := 'Group 1';
aGroupInfo.Footer := 'Footer';
aGroupInfo.HeaderAlign := taLeftJustify;
aGroupInfo.FooterAlign := taLeftJustify;
aGroupInfo.Subtitle := 'Subtitle';
aGroupInfo.TitleImage := 0;
Self.fraListView.AddGroup(aGroupInfo,true);

aGroupInfo.Header := 'Group 2';
Self.fraListView.AddGroup(aGroupInfo,false);

aGroupInfo.Header := 'Group 3';
Self.fraListView.AddGroup(aGroupInfo,false);

aGroupInfo.Header := 'Group 4';
Self.fraListView.AddGroup(aGroupInfo,false);

ListItemInfo.Caption := 'Item 1';
ListItemInfo.Checked := True;
ListItemInfo.GroupID := 0;
ListItemInfo.ImageIndex := 0;
ListItemInfo.StateIndex := 0;
ListItemInfo.OverlayIndex := 0;
Self.fraListView.AddItem(ListItemInfo,True);

ListItemInfo.Caption := 'Item 2';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 0;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 3';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 0;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 4';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 0;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 5';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 1;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 6';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 1;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 7';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 2;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 8';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 3;
Self.fraListView.AddItem(ListItemInfo,False);

ListItemInfo.Caption := 'Item 9';
ListItemInfo.Checked := false;
ListItemInfo.GroupID := 3;
Self.fraListView.AddItem(ListItemInfo,False);


self.fraListView.ListView.Items.Item[0].SubItems.add('2');
self.fraListView.ListView.Items.Item[0].SubItems.add('3');
self.fraListView.ListView.Items.Item[0].SubItems.add('4');
self.fraListView.ListView.Items.Item[0].SubItems.add('5');
self.fraListView.ListView.Items.Item[0].SubItems.add('6');
self.fraListView.ListView.Items.Item[0].SubItems.add('7');
self.fraListView.ListView.Items.Item[0].SubItems.add('8');
self.fraListView.ListView.Items.Item[0].SubItems.add('9');



Self.fraListView.UpdateActionStates;


end;

end.
