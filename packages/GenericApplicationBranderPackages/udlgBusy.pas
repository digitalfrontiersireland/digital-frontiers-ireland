unit udlgBusy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufraBusy;

type
  TdlgBusy = class(TForm)
    fraBusy: TfraBusy;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgBusy: TdlgBusy;

implementation

{$R *.dfm}

end.
