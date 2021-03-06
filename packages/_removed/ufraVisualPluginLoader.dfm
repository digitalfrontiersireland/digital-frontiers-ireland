object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 648
  Height = 368
  TabOrder = 0
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 648
    Height = 368
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Plugin Options'
      DesignSize = (
        640
        337)
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 30
        Height = 16
        Caption = 'Path:'
      end
      object Label2: TLabel
        Left = 24
        Top = 54
        Width = 57
        Height = 16
        Caption = 'Filename:'
      end
      object Label3: TLabel
        Left = 24
        Top = 92
        Width = 44
        Height = 16
        Caption = 'Handle:'
      end
      object ebPath: TEdit
        Left = 60
        Top = 13
        Width = 548
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object ebFilename: TEdit
        Left = 87
        Top = 51
        Width = 521
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
      object btnLoad: TButton
        Left = 533
        Top = 301
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Load'
        Enabled = False
        TabOrder = 2
        OnClick = btnLoadClick
      end
      object btnUnload: TButton
        Left = 452
        Top = 301
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Unload'
        Enabled = False
        TabOrder = 3
        OnClick = btnUnloadClick
      end
      object btnSelect: TButton
        Left = 24
        Top = 301
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Select'
        TabOrder = 4
        OnClick = btnSelectClick
      end
      object ebHandle: TEdit
        Left = 87
        Top = 89
        Width = 409
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 5
      end
      object cbIsLoaded: TCheckBox
        Left = 502
        Top = 93
        Width = 97
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Is Loaded?'
        TabOrder = 6
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Plugin Details'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        640
        337)
      object Label4: TLabel
        Left = 6
        Top = 16
        Width = 48
        Height = 16
        Alignment = taRightJustify
        Caption = 'Caption:'
      end
      object Label5: TLabel
        Left = 7
        Top = 43
        Width = 47
        Height = 16
        Alignment = taRightJustify
        Caption = 'Exports:'
      end
      object Label6: TLabel
        Left = 222
        Top = 43
        Width = 24
        Height = 16
        Alignment = taRightJustify
        Caption = 'IPC:'
      end
      object ebCaption: TEdit
        Left = 60
        Top = 13
        Width = 548
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object lbExports: TListBox
        Left = 60
        Top = 43
        Width = 133
        Height = 134
        TabOrder = 1
      end
      object ebIPC: TEdit
        Left = 252
        Top = 43
        Width = 356
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 222
        Top = 73
        Width = 386
        Height = 104
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Group Info:'
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 3
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 59
    Top = 176
  end
end
