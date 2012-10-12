object fraCompanySaveData: TfraCompanySaveData
  Left = 0
  Top = 0
  Width = 483
  Height = 84
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 483
    Height = 84
    Align = alClient
    Caption = 'Save to'
    TabOrder = 0
    DesignSize = (
      483
      84)
    object ebFolder: TLabeledEdit
      Left = 24
      Top = 40
      Width = 364
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 41
      EditLabel.Height = 16
      EditLabel.Caption = 'Folder:'
      TabOrder = 0
    end
    object btnFind: TButton
      Left = 394
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Find'
      TabOrder = 1
      OnClick = btnFindClick
    end
  end
  object SelectDirectory: TJvSelectDirectory
    ClassicDialog = False
    Left = 224
    Top = 32
  end
end
