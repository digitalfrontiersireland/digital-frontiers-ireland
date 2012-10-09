unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraVisualPluginLoader, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Frame11: TFrame1;
    procedure Frame11btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Frame11btnLoadClick(Sender: TObject);
begin
  Frame11.btnLoadClick(Sender);

end;

end.
