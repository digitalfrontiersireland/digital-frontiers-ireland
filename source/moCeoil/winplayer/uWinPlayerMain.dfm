object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'moCeoil Player'
  ClientHeight = 466
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Ribbon: TRibbon
    Left = 0
    Top = 0
    Width = 585
    Height = 180
    ActionManager = ActionManager
    Caption = 'Ribbon'
    Tabs = <
      item
        Caption = 'moCeoil'
        Page = RibbonPage1
      end
      item
        Caption = 'Website'
        Page = RibbonPage2
      end
      item
        Caption = 'Update'
        Page = RibbonPage3
      end>
    DesignSize = (
      585
      180)
    StyleName = 'Ribbon - Luna'
    object RibbonPage2: TRibbonPage
      Left = 0
      Top = 64
      Width = 584
      Height = 116
      Caption = 'Website'
      Index = 1
      object RibbonGroup4: TRibbonGroup
        Left = 4
        Top = 3
        Width = 100
        Height = 108
        ActionManager = ActionManager
        Caption = 'Home'
        GroupIndex = 0
      end
    end
    object RibbonPage3: TRibbonPage
      Left = 0
      Top = 64
      Width = 584
      Height = 116
      Caption = 'Update'
      Index = 2
      object RibbonGroup5: TRibbonGroup
        Left = 4
        Top = 3
        Width = 100
        Height = 108
        ActionManager = ActionManager
        Caption = 'Status'
        GroupIndex = 0
      end
    end
    object RibbonPage1: TRibbonPage
      Left = 0
      Top = 64
      Width = 584
      Height = 116
      Caption = 'moCeoil'
      Index = 0
      object RibbonGroup1: TRibbonGroup
        Left = 4
        Top = 3
        Width = 103
        Height = 108
        ActionManager = ActionManager
        Caption = 'Music'
        GroupIndex = 0
      end
      object RibbonGroup2: TRibbonGroup
        Left = 109
        Top = 3
        Width = 110
        Height = 108
        ActionManager = ActionManager
        Caption = 'DJ'
        GroupIndex = 1
      end
      object RibbonGroup3: TRibbonGroup
        Left = 221
        Top = 3
        Width = 67
        Height = 108
        ActionManager = ActionManager
        Caption = 'Social'
        GroupIndex = 2
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 447
    Width = 585
    Height = 19
    Panels = <>
  end
  object WebBrowser: TWebBrowser
    Left = 0
    Top = 180
    Width = 585
    Height = 267
    Align = alClient
    TabOrder = 2
    ExplicitTop = 181
    ControlData = {
      4C0000005F300000141600000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = actViewPlayer
          end
          item
            Action = actExtraInfo
          end>
        ActionBar = RibbonGroup1
      end
      item
        Items = <
          item
            Action = actCentovaCast
          end>
        ActionBar = RibbonGroup2
      end
      item
        Items = <
          item
            Action = Photos
            Caption = '&Photos'
          end
          item
            Action = Action1
          end>
        ActionBar = RibbonGroup3
      end>
    Left = 288
    Top = 240
    StyleName = 'Ribbon - Luna'
    object actViewPlayer: TAction
      Caption = '&View Player'
      OnExecute = actViewPlayerExecute
    end
    object actExtraInfo: TAction
      Caption = '&Hosts Page'
      OnExecute = actExtraInfoExecute
    end
    object actCentovaCast: TAction
      Caption = '&CentovaCast'
    end
    object Action1: TAction
      Caption = '&Video'
    end
    object Photos: TAction
      Caption = 'Photos'
    end
  end
end
