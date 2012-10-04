object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 354
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  inline Frame11: TFrame1
    Left = 0
    Top = 0
    Width = 622
    Height = 354
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 354
    inherited PageControl: TPageControl
      Width = 622
      Height = 354
      ExplicitWidth = 622
      ExplicitHeight = 354
      inherited TabSheet1: TTabSheet
        ExplicitWidth = 614
        ExplicitHeight = 323
        inherited ebPath: TEdit
          Width = 522
          ExplicitWidth = 522
        end
        inherited ebFilename: TEdit
          Width = 495
          ExplicitWidth = 495
        end
        inherited btnLoad: TButton
          Left = 507
          Top = 295
          OnClick = Frame11btnLoadClick
          ExplicitLeft = 507
          ExplicitTop = 295
        end
        inherited btnUnload: TButton
          Left = 426
          Top = 295
          ExplicitLeft = 426
          ExplicitTop = 295
        end
        inherited btnSelect: TButton
          Top = 295
          ExplicitTop = 295
        end
        inherited ebHandle: TEdit
          Width = 383
          ExplicitWidth = 383
        end
        inherited cbIsLoaded: TCheckBox
          Left = 476
          ExplicitLeft = 476
        end
      end
      inherited TabSheet2: TTabSheet
        inherited ebCaption: TEdit
          Width = 496
          ExplicitWidth = 496
        end
        inherited lbExports: TListBox
          Height = 139
          ExplicitHeight = 139
        end
        inherited ebIPC: TEdit
          Width = 304
          ExplicitWidth = 304
        end
        inherited GroupBox1: TGroupBox
          Width = 360
          ExplicitWidth = 360
        end
      end
    end
  end
end
