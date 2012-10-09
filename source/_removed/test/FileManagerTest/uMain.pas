unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraFileListView, Vcl.Menus;

type
  TForm1 = class(TForm)
    Frame21: TFrame2;
    AddFile1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses uCustomLists;
{$R *.dfm}

end.
