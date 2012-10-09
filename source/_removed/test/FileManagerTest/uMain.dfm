object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 399
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  inline Frame21: TFrame2
    Left = 0
    Top = 0
    Width = 728
    Height = 399
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 728
    ExplicitHeight = 399
    inherited fraListView: TfraListView
      Width = 728
      Height = 399
      ExplicitWidth = 728
      ExplicitHeight = 399
      inherited ListView: TJvListView
        Width = 728
        Height = 380
        Columns = <
          item
            AutoSize = True
          end
          item
            AutoSize = True
          end
          item
            AutoSize = True
          end>
        ColumnsOrder = '0=50,1=50,2=50'
        ExtendedColumns = <
          item
          end
          item
          end
          item
          end>
        ExplicitWidth = 728
        ExplicitHeight = 380
      end
      inherited StatusBar: TJvStatusBar
        Top = 380
        Width = 728
        ExplicitTop = 380
        ExplicitWidth = 728
      end
      inherited Menu_ListView: TJvPopupMenu
        object AddFile1: TMenuItem
          Action = Frame21.actAddFile
        end
      end
    end
  end
end
