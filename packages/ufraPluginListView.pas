unit ufraPluginListView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraListView, Vcl.ComCtrls,
  Vcl.ToolWin, JvExComCtrls, JvToolBar, Vcl.ActnList, Vcl.Menus, uDLLUtilsEx,
  uPluginUtilsEx;

type
  TfraPluginListView = class(TFrame)
    fraListView: TfraListView;
    OpenDialog: TOpenDialog;
    PluginManager: TPluginManager;
    ActionList_Plugins: TActionList;
    actAddPlugin: TAction;
    N1: TMenuItem;
    actLoadPlugin: TAction;
    actUnloadPlugin: TAction;
    actLoadAll: TAction;
    actUnloadAll: TAction;
    procedure actAddPluginExecute(Sender: TObject);
    procedure fraListViewactClearListViewExecute(Sender: TObject);
    procedure fraListViewactRefreshListViewExecute(Sender: TObject);
    procedure fraListViewactAddListviewItemExecute(Sender: TObject);
    procedure fraListViewactDeleteItemExecute(Sender: TObject);
    procedure fraListViewactSelectAllExecute(Sender: TObject);
    procedure fraListViewactSelectNoneExecute(Sender: TObject);
    procedure fraListViewactSelectInvertExecute(Sender: TObject);
    procedure actLoadAllExecute(Sender: TObject);
    procedure actUnloadAllExecute(Sender: TObject);
    procedure fraListViewactSelectFirstExecute(Sender: TObject);
    procedure PluginManagerDllProgressEvent(Sender: TObject; Min, Max,
      Position: Integer; aMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TfraPluginListView.actLoadAllExecute(Sender: TObject);
begin
PluginManager.LoadAll;
end;

procedure TfraPluginListView.actUnloadAllExecute(Sender: TObject);
begin
PluginManager.UnloadAll;
end;

procedure TfraPluginListView.fraListViewactAddListviewItemExecute(
  Sender: TObject);
begin
  fraListView.actAddListviewItemExecute(Sender);

end;

procedure TfraPluginListView.fraListViewactClearListViewExecute(
  Sender: TObject);
begin
  fraListView.actClearListViewExecute(Sender);
  PluginManager.ClearDlls;
end;

procedure TfraPluginListView.fraListViewactDeleteItemExecute(Sender: TObject);
begin
  fraListView.actDeleteItemExecute(Sender);

end;

procedure TfraPluginListView.fraListViewactRefreshListViewExecute(
  Sender: TObject);
Var
  i               : integer;
  aListItem       : TListItem;
  aListItemInfo   : TListItemInfoRec;
  aPlugin         : TPluginObject;
begin
fraListView.actRefreshListViewExecute(Sender);

if (PluginManager.DLLList.Count > 0) AND
   (fraListView.ListView.Items.Count > 0)then
      Begin
      fraListView.ListView.Items.BeginUpdate;

      for i := 0 to fraListView.ListView.Items.Count - 1 do
           Begin
           aPlugin := fraListView.ListView.Items.Item[i].Data;

           if aPlugin <> nil then
           if aPlugin.IsLoaded then
              Begin
                fraListView.ListView.Items.Item[i].Caption := aPlugin.GetListItemCaption(Self);
                fraListView.ListView.Items.Item[i].SubItems.Clear;
                fraListView.ListView.Items.Item[i].SubItems.Add('Yes');
              End
           else
              begin
                fraListView.ListView.Items.Item[i].SubItems.Clear;
                fraListView.ListView.Items.Item[i].SubItems.Add('No');
              end;
           aPlugin := nil;
           End;

      fraListView.ListView.Items.EndUpdate;
      End;


end;

procedure TfraPluginListView.fraListViewactSelectAllExecute(Sender: TObject);
begin
  fraListView.actSelectAllExecute(Sender);
end;

procedure TfraPluginListView.fraListViewactSelectFirstExecute(Sender: TObject);
begin
  fraListView.actSelectFirstExecute(Sender);

end;

procedure TfraPluginListView.fraListViewactSelectInvertExecute(Sender: TObject);
begin
  fraListView.actSelectInvertExecute(Sender);
end;

procedure TfraPluginListView.fraListViewactSelectNoneExecute(Sender: TObject);
begin
  fraListView.actSelectNoneExecute(Sender);
end;


procedure TfraPluginListView.PluginManagerDllProgressEvent(Sender: TObject; Min,
  Max, Position: Integer; aMessage: string);
begin
//TODO: Reimplmenet
end;

procedure TfraPluginListView.actAddPluginExecute(Sender: TObject);
Var
  aItemInfo : TListItemInfoRec;
  aPlugin   : TPluginObject;
  Files     : TStringList;
  i         : integer;
begin
Files := TStringList.Create;

if OpenDialog.Execute(Self.Handle) then
   Begin
   Files.Text := OpenDialog.Files.Text;
   PluginManager.AddDlls(Files);


   for i := 0 to PluginManager.Count -1 do
        Begin
        aPlugin := PluginManager.GetInfo(I);

        if aPlugin.IsLoaded then
           Begin
           aItemInfo.Caption := aPlugin.GetListItemCaption(Self);
           aItemInfo.Data := PluginManager.DLLList.Items[i];
           End
        else
           Begin
           aItemInfo.Caption := 'Unknown Plugin';
           aItemInfo.Data := PluginManager.DLLList.Items[i];
           End;
        if i = 0 then
          Begin
          fraListView.AddItem(aItemInfo,True);
          End
        ELSE
          Begin
            fraListView.AddItem(aItemInfo,False);
          End;
        End;
   End;
Files.Free;
fraListView.actRefreshListView.Execute;
end;

end.
