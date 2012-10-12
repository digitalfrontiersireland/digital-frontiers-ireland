object frmRebrand: TfrmRebrand
  Left = 0
  Top = 0
  ActiveControl = fraCompanyInfo.ebCompanyName
  Caption = 'frmRebrand'
  ClientHeight = 488
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object JvWizard: TJvWizard
    Left = 0
    Top = 0
    Width = 739
    Height = 488
    ActivePage = JvWizardInteriorPage1
    ButtonBarHeight = 42
    ButtonStart.Caption = 'To &Start Page'
    ButtonStart.NumGlyphs = 1
    ButtonStart.Width = 85
    ButtonLast.Caption = 'To &Last Page'
    ButtonLast.NumGlyphs = 1
    ButtonLast.Width = 85
    ButtonBack.Caption = '< &Back'
    ButtonBack.NumGlyphs = 1
    ButtonBack.Width = 75
    ButtonNext.Caption = '&Next >'
    ButtonNext.NumGlyphs = 1
    ButtonNext.Width = 75
    ButtonFinish.Caption = '&Finish'
    ButtonFinish.NumGlyphs = 1
    ButtonFinish.ModalResult = 1
    ButtonFinish.Width = 75
    ButtonCancel.Caption = 'Cancel'
    ButtonCancel.NumGlyphs = 1
    ButtonCancel.ModalResult = 2
    ButtonCancel.Width = 75
    ButtonHelp.Caption = '&Help'
    ButtonHelp.NumGlyphs = 1
    ButtonHelp.Width = 75
    ShowRouteMap = True
    DesignSize = (
      739
      488)
    object JvWizardInteriorPage1: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Company or Institution Details'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'This wizard will guide you through rebranding the Pixi for Windo' +
        'ws toolset for use within your Company or Organization'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Caption = 'Rebrand Pixi Toolset'
      inline fraCompanyInfo: TfraCompanyInfo
        Left = 0
        Top = 70
        Width = 594
        Height = 376
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 70
        ExplicitWidth = 594
        ExplicitHeight = 376
        inherited GroupBox1: TGroupBox
          Width = 594
          Height = 376
          ExplicitWidth = 594
          ExplicitHeight = 376
          DesignSize = (
            594
            376)
          inherited ebCompanyName: TLabeledEdit
            Width = 427
            ExplicitWidth = 427
          end
          inherited ebSlogan: TLabeledEdit
            Width = 427
            ExplicitWidth = 427
          end
          inherited GroupBox2: TGroupBox
            Width = 427
            Height = 277
            ExplicitWidth = 427
            ExplicitHeight = 277
            inherited Panel1: TPanel
              Top = 234
              Width = 423
              ExplicitTop = 234
              ExplicitWidth = 423
              DesignSize = (
                423
                41)
              inherited btnAdd: TButton
                Left = 338
                ExplicitLeft = 338
              end
              inherited btnRemove: TButton
                Left = 257
                ExplicitLeft = 257
              end
            end
            inherited JvThumbView: TJvThumbView
              Width = 398
              Height = 191
              ExplicitWidth = 398
              ExplicitHeight = 191
            end
            inherited TrackBarH: TTrackBar
              Height = 191
              ExplicitHeight = 191
            end
            inherited TrackBarW: TTrackBar
              Width = 423
              ExplicitWidth = 423
            end
          end
        end
        inherited ActionList: TActionList
          inherited actAddFile: TAction
            OnExecute = fraCompanyInfo1actAddFileExecute
          end
        end
      end
    end
    object JvWizardInteriorPage2: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Provide Additional Details'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'This page gives you the opportunity to provide additional detail' +
        's to the end user that is shown in various parts of different pr' +
        'oducts aimed at making it easy for end users to get in touch'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Caption = 'Additional Details'
      inline fraCompanyContactInfo: TfraCompanyContactInfo
        Left = 0
        Top = 70
        Width = 543
        Height = 341
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 70
        ExplicitWidth = 543
        ExplicitHeight = 341
        inherited PageControl: TPageControl
          Width = 543
          Height = 341
          ExplicitWidth = 543
          ExplicitHeight = 341
          inherited TabSheet1: TTabSheet
            ExplicitWidth = 535
            ExplicitHeight = 310
            inherited memoAddress: TMemo
              Width = 535
              Height = 172
              ExplicitWidth = 535
              ExplicitHeight = 172
            end
            inherited Panel4: TPanel
              Top = 172
              Width = 535
              Height = 138
              ExplicitTop = 172
              ExplicitWidth = 535
              ExplicitHeight = 138
              inherited ebCity: TLabeledEdit
                Anchors = [akLeft, akTop, akBottom]
                EditLabel.ExplicitLeft = 40
                EditLabel.ExplicitTop = 10
                EditLabel.ExplicitWidth = 26
              end
              inherited ebCountyState: TLabeledEdit
                Anchors = [akLeft, akTop, akBottom]
                EditLabel.ExplicitLeft = 181
                EditLabel.ExplicitTop = 10
                EditLabel.ExplicitWidth = 79
              end
              inherited ebCountry: TLabeledEdit
                Anchors = [akLeft, akTop, akBottom]
                EditLabel.ExplicitLeft = 17
                EditLabel.ExplicitTop = 43
                EditLabel.ExplicitWidth = 49
              end
              inherited ebPostCode: TLabeledEdit
                Anchors = [akLeft, akTop, akBottom]
                EditLabel.ExplicitLeft = 198
                EditLabel.ExplicitTop = 43
                EditLabel.ExplicitWidth = 62
              end
              inherited Panel5: TPanel
                Top = 96
                Width = 533
                ExplicitTop = 96
                ExplicitWidth = 533
                DesignSize = (
                  533
                  41)
                inherited LabeledEdit1: TLabeledEdit
                  Anchors = [akLeft, akTop, akBottom]
                end
                inherited LabeledEdit2: TLabeledEdit
                  Anchors = [akLeft]
                end
              end
            end
          end
          inherited TabSheet2: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 27
            ExplicitWidth = 442
            ExplicitHeight = 210
            inherited lvTelephone: TListView
              ExplicitHeight = 185
            end
            inherited Panel1: TPanel
              ExplicitTop = 185
            end
          end
          inherited Emails: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 27
            ExplicitWidth = 442
            ExplicitHeight = 210
            inherited ListView1: TListView
              ExplicitHeight = 185
            end
            inherited Panel2: TPanel
              ExplicitTop = 185
            end
          end
          inherited TabSheet3: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 27
            ExplicitWidth = 442
            ExplicitHeight = 210
            inherited Panel3: TPanel
              ExplicitTop = 185
            end
            inherited ListView2: TListView
              ExplicitHeight = 185
            end
          end
          inherited Support: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 27
            ExplicitWidth = 442
            ExplicitHeight = 210
          end
        end
      end
    end
    object JvWizardInteriorPage3: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Live Data'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'Live data is downloaded from the internet, this can come in the ' +
        'form of Program Updates, Patches, Additional Software, Advertisi' +
        'ng and so on'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Color = clWhite
      Caption = 'Live Data'
      inline fraCompanyLiveData: TfraCompanyLiveData
        Left = 0
        Top = 70
        Width = 594
        Height = 376
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 70
        ExplicitWidth = 594
        ExplicitHeight = 376
        inherited ListView: TListView
          Width = 594
          Height = 335
          ExplicitWidth = 594
          ExplicitHeight = 335
        end
        inherited Panel1: TPanel
          Top = 335
          Width = 594
          ExplicitTop = 335
          ExplicitWidth = 594
          inherited btnAdd: TButton
            Left = 513
            ExplicitLeft = 513
          end
          inherited btnRemove: TButton
            Left = 432
            ExplicitLeft = 432
          end
        end
      end
    end
    object JvWizardInteriorPage4: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Save your Choices'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'Choose a location to place your rebranded application. This prog' +
        'ram will copy all needed files to that location and any choices ' +
        'you'#39've made'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Caption = 'Save your Choices'
      inline fraCompanySaveData: TfraCompanySaveData
        Left = 0
        Top = 70
        Width = 594
        Height = 376
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 70
        ExplicitWidth = 594
        ExplicitHeight = 376
        inherited GroupBox1: TGroupBox
          Width = 594
          Height = 376
          ExplicitWidth = 594
          ExplicitHeight = 376
          inherited ebFolder: TLabeledEdit
            Width = 475
            ExplicitWidth = 475
          end
          inherited btnFind: TButton
            Left = 505
            OnClick = fraCompanySaveData1btnFindClick
            ExplicitLeft = 505
          end
        end
      end
    end
    object JvWizardInteriorPage5: TJvWizardInteriorPage
      Header.Title.Color = clNone
      Header.Title.Text = 'Copy Files'
      Header.Title.Anchors = [akLeft, akTop, akRight]
      Header.Title.Font.Charset = DEFAULT_CHARSET
      Header.Title.Font.Color = clWindowText
      Header.Title.Font.Height = -20
      Header.Title.Font.Name = 'Tahoma'
      Header.Title.Font.Style = [fsBold]
      Header.Subtitle.Color = clNone
      Header.Subtitle.Text = 
        'We need to copy the original files to a new location to perform ' +
        'the rebranding. Choose a Source and Destination folder and add a' +
        'ny additional files that you need'
      Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
      Header.Subtitle.Font.Charset = DEFAULT_CHARSET
      Header.Subtitle.Font.Color = clWindowText
      Header.Subtitle.Font.Height = -13
      Header.Subtitle.Font.Name = 'Tahoma'
      Header.Subtitle.Font.Style = []
      Caption = 'Required Files'
      inline fraCopyFiles: TfraCopyFiles
        Left = 0
        Top = 70
        Width = 594
        Height = 376
        Align = alClient
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 70
        ExplicitWidth = 594
        ExplicitHeight = 376
        inherited GroupBox1: TGroupBox
          Width = 594
          ExplicitWidth = 594
          inherited ebSource: TLabeledEdit
            Width = 440
            ExplicitWidth = 440
          end
          inherited btnFindSource: TButton
            Left = 470
            ExplicitLeft = 470
          end
          inherited btnFindDestination: TButton
            Left = 470
            ExplicitLeft = 470
          end
          inherited ebDestination: TLabeledEdit
            Width = 440
            ExplicitWidth = 440
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 594
          Height = 170
          ExplicitWidth = 594
          ExplicitHeight = 170
          inherited PageControl: TPageControl
            Width = 590
            Height = 150
            ExplicitWidth = 590
            ExplicitHeight = 150
            inherited tsLog: TTabSheet
              ExplicitWidth = 582
              ExplicitHeight = 119
              inherited lvLog: TListView
                Width = 582
                Height = 91
                ExplicitWidth = 582
                ExplicitHeight = 91
              end
              inherited Panel3: TPanel
                Top = 91
                Width = 582
                ExplicitTop = 91
                ExplicitWidth = 582
                inherited Button1: TButton
                  Left = 506
                  ExplicitLeft = 506
                end
                inherited btnSaveLog: TButton
                  Left = 431
                  ExplicitLeft = 431
                end
              end
            end
          end
        end
        inherited Panel1: TPanel
          Top = 323
          Width = 594
          ExplicitTop = 323
          ExplicitWidth = 594
          inherited btnBegin: TButton
            Left = 505
            ExplicitLeft = 505
          end
          inherited btnStop: TButton
            Left = 424
            ExplicitLeft = 424
          end
          inherited ProgressBar: TProgressBar
            Width = 592
            ExplicitWidth = 592
          end
        end
      end
    end
    object JvWizardRouteMapSteps1: TJvWizardRouteMapSteps
      Left = 0
      Top = 0
      Width = 145
      Height = 446
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
