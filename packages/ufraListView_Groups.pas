unit ufraListView_Groups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, ufraListView,
  JvListView;


type
  TfraListView_Groups = class(TFrame)
    fraListView: TfraListView;
    procedure fraListViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddGroupsFrom(Var aListView : TjvListView);
  end;

implementation

{$R *.dfm}


procedure TfraListView_Groups.AddGroupsFrom(Var aListView : TjvListView);
Var
  i : integer;
  Item : TListItem;
Begin
if Assigned(aListView) then
   Begin
   with fraListView do
      Begin
        ListView.Items.BeginUpdate;
        ListView.Items.Clear;
        for i := 0 to aListView.Groups.Count - 1 do
             Begin
               Item := ListView.Items.Add;
               Item.Caption := aListView.Groups.Items[i].Header;
               Item.SubItems.Add(aListView.Groups.Items[i].Footer);
               Item.SubItems.Add(aListView.Groups.Items[i].Subtitle);
               Item.SubItems.Add(IntToStr(aListView.Groups.Items[i].GroupID));
               Item.SubItems.Add(IntToStr(aListView.Groups.Items[i].TitleImage));
             End;
        ListView.Items.EndUpdate;
      End;
   End;

End;

procedure TfraListView_Groups.fraListViewClick(Sender: TObject);
begin
  fraListView.FrameClick(Sender);

end;

end.
