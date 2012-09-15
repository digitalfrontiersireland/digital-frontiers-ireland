object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'SimpleStorage Demo'
  ClientHeight = 659
  ClientWidth = 1149
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object spData: TSplitter
    Left = 399
    Top = 0
    Width = 6
    Height = 659
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Beveled = True
  end
  object mmSourceData: TMemo
    Left = 0
    Top = 0
    Width = 399
    Height = 659
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    TabOrder = 0
    WordWrap = False
  end
  object mmResultsData: TMemo
    Left = 405
    Top = 0
    Width = 411
    Height = 659
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 1
    WordWrap = False
  end
  object pnActions: TPanel
    Left = 816
    Top = 0
    Width = 333
    Height = 659
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    TabOrder = 2
    DesignSize = (
      333
      659)
    object imgLogo: TImage
      Left = 8
      Top = 424
      Width = 318
      Height = 226
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Stretch = True
    end
    object rgDemoSelection: TRadioGroup
      Left = 8
      Top = 10
      Width = 318
      Height = 406
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = 'Demo Selection'
      Items.Strings = (
        '1 - Simple Single Value Selection'
        '2 - Simple Values Enumeration'
        '3 - Simple Elements Enumeration'
        '4 - Add Some Elements'
        '5 - Assign one Storage to Other'
        '6 - Store and Read Binary Data'
        '7 - Enumeration with XPath selection'
        '8 - Store and Read Compressed Data'
        '9 - Store and Read Encrypted Data'
        '10 - Filter Chaining (Compress -> Encrypt)'
        '11 - Read and Write CData integer value'
        '12 - Assign a subtree to element'
        '13 - Update a element with subtree'
        '14 - Handling load parse error '
        '15 - Use SimpleStorage with legacy code')
      TabOrder = 0
      OnClick = rgDemoSelectionClick
    end
  end
  object XPManifest: TXPManifest
    Left = 152
    Top = 112
  end
end
