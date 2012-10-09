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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


end.
