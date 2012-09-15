object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'IPC Server'
  ClientHeight = 458
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 17
  object lbServerName: TLabel
    Left = 13
    Top = 21
    Width = 79
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Server Name'
  end
  object eServerName: TEdit
    Left = 13
    Top = 46
    Width = 186
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
    Text = 'TestServer'
  end
  object ListBox1: TListBox
    Left = 209
    Top = 21
    Width = 551
    Height = 426
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ItemHeight = 17
    TabOrder = 1
  end
  object btnStart: TButton
    Left = 52
    Top = 94
    Width = 98
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Start'
    TabOrder = 2
    OnClick = btnStartClick
  end
end
