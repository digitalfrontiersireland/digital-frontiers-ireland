object fraGenericProgramInfo: TfraGenericProgramInfo
  Left = 0
  Top = 0
  Width = 652
  Height = 161
  TabOrder = 0
  object GroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 652
    Height = 161
    Align = alClient
    Caption = 'Program Information'
    TabOrder = 0
    DesignSize = (
      652
      161)
    object ebFilename: TLabeledEdit
      Left = 112
      Top = 19
      Width = 153
      Height = 24
      EditLabel.Width = 57
      EditLabel.Height = 16
      EditLabel.Caption = 'Filename:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 0
    end
    object ebPath: TLabeledEdit
      Left = 112
      Top = 49
      Width = 153
      Height = 24
      EditLabel.Width = 30
      EditLabel.Height = 16
      EditLabel.Caption = 'Path:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 1
    end
    object ebVersion: TLabeledEdit
      Left = 112
      Top = 79
      Width = 153
      Height = 24
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.Caption = 'Version:'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object pnlRight: TPanel
      Left = 271
      Top = 18
      Width = 379
      Height = 141
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 3
      object ListView: TListView
        Left = 0
        Top = 0
        Width = 379
        Height = 121
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Item'
          end
          item
            AutoSize = True
            Caption = 'Value'
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object btnToFile: TButton
        Left = 0
        Top = 121
        Width = 379
        Height = 20
        Align = alBottom
        Caption = 'Save to File...'
        TabOrder = 1
        OnClick = btnToFileClick
      end
    end
    object btnMoreInfo: TButton
      Left = 200
      Top = 134
      Width = 65
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = 'Get Help'
      TabOrder = 4
      OnClick = btnMoreInfoClick
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text Files|*.txt|All Files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofEnableSizing]
    Title = 'Save to File'
    Left = 24
    Top = 96
  end
end
