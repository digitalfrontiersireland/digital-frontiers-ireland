unit uGenericMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.StdCtrls, JvTranslateString, JvFormPlacementSelectList, JvFormPlacement,
  JvAppStorageSelectList, JvComponentBase, JvAppStorage, JvAppXMLStorage;

type
  TfrmGeneric = class(TForm)
    Ribbon: TRibbon;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeneric: TfrmGeneric;

implementation
uses udmGenericComponents;
{$R *.dfm}

procedure TfrmGeneric.FormCreate(Sender: TObject);
begin
if Assigned(dmGenericComponents) then
   Begin
   with dmGenericComponents do
      Begin
      CommandLineProcessor.Process;
      End;
   End;

end;

end.
