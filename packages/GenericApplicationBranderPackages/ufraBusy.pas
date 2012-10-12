unit ufraBusy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls,
  JvAnimatedImage, JvGIFCtrl, Vcl.StdCtrls;

type
  TfraBusy = class(TFrame)
    jvGIFAnimation: TJvGIFAnimator;
    lblStatus: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
