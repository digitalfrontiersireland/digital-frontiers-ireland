object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 376
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  inline fraPluginListView1: TfraPluginListView
    Left = 0
    Top = 0
    Width = 557
    Height = 376
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 557
    ExplicitHeight = 376
    inherited fraListView: TfraListView
      Width = 557
      Height = 376
      ExplicitWidth = 557
      ExplicitHeight = 376
      inherited ListView: TJvListView
        Width = 557
        Height = 357
        Columns = <
          item
            AutoSize = True
            Caption = 'Plugin Name'
          end
          item
            AutoSize = True
            Caption = 'Is Active'
          end
          item
            AutoSize = True
            Caption = 'Handle'
          end>
        FlatScrollBars = True
        GridLines = True
        ColumnsOrder = '0=50,1=50,2=50'
        ExtendedColumns = <
          item
          end
          item
          end
          item
          end>
        ExplicitWidth = 557
        ExplicitHeight = 357
      end
      inherited StatusBar: TJvStatusBar
        Top = 357
        Width = 557
        ExplicitTop = 357
        ExplicitWidth = 557
      end
      inherited Menu_ListView: TJvPopupMenu
        object Add1: TMenuItem
          Action = fraPluginListView1.actAddPlugin
        end
        object LoadAll1: TMenuItem
          Action = fraPluginListView1.actLoadAll
        end
        object UnloadAll1: TMenuItem
          Action = fraPluginListView1.actUnloadAll
        end
        object UnloadPlugin1: TMenuItem
          Action = fraPluginListView1.actUnloadPlugin
        end
      end
    end
    inherited ActionList_Plugins: TActionList
      inherited actAddPlugin: TAction
        OnExecute = fraPluginListView1actAddPluginExecute
      end
    end
  end
end
