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
    ActionList_Plugins: TActionList;
    actAddPlugin: TAction;
    N1: TMenuItem;
    actLoadPlugin: TAction;
    actUnloadPlugin: TAction;
    actLoadAll: TAction;
    actUnloadAll: TAction;
    PluginManager: TPluginManager;
    procedure actAddPluginExecute(Sender: TObject);
    procedure fraListViewactClearListViewExecute(Sender: TObject);
    procedure fraListViewactRefreshListViewExecute(Sender: TObject);
    procedure actLoadAllExecute(Sender: TObject);
    procedure actUnloadAllExecute(Sender: TObject);
    procedure PluginManagerUpdatingListItem(sender: TObject;
      var ListItem: TListItem; atIndex : integer);
    procedure fraListViewactStatusBarVisibleExecute(Sender: TObject);
    procedure fraListViewactDotNetHighlightExecute(Sender: TObject);
    procedure fraListViewactAddListviewItemExecute(Sender: TObject);
    procedure fraListViewactDeleteItemExecute(Sender: TObject);
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
fraListView.actRefreshListView.Execute;
end;

procedure TfraPluginListView.actUnloadAllExecute(Sender: TObject);
begin
PluginManager.UnloadAll;
fraListView.actRefreshListView.Execute;
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

procedure TfraPluginListView.fraListViewactDotNetHighlightExecute(
  Sender: TObject);
begin
  fraListView.actDotNetHighlightExecute(Sender);

end;

procedure TfraPluginListView.fraListViewactRefreshListViewExecute(
  Sender: TObject);
begin
PluginManager.RefreshListView(self.fraListView.ListView,true);
fraListView.actRefreshListViewExecute(Sender);
end;



procedure TfraPluginListView.fraListViewactStatusBarVisibleExecute(
  Sender: TObject);
begin
  fraListView.actStatusBarVisibleExecute(Sender);

end;

procedure TfraPluginListView.PluginManagerUpdatingListItem(sender: TObject;
  var ListItem: TListItem; atIndex : integer);
begin
if (TPluginObject(PluginManager.DLLList[atIndex]).IsLoaded) AND
   (TPluginObject(PluginManager.DLLList[atIndex]).IsValidPlugin) then
      Begin
      ListItem.Caption := TPluginObject(PluginManager.DLLList[atIndex]).GetListItemCaption(Self);
      End;


{if DLLObject.IsLoaded and DLLObject.IsValidPlugin then
   Begin
   ListItem.Caption := TPluginObject(PluginManager.DLLList[atIndex]).ListItemCaption;
   End;}
end;

procedure TfraPluginListView.actAddPluginExecute(Sender: TObject);
Var
  Files     : TStringList;
begin
Files := TStringList.Create;

if OpenDialog.Execute(Self.Handle) then
   Begin
   Files.Text := OpenDialog.Files.Text;
   PluginManager.AddDlls(Files);

 PluginManager.RefreshListView(self.fraListView.ListView, true);
   End;

FreeAndNil(Files);

//fraListView.actRefreshListView.Execute;


end;


end.
