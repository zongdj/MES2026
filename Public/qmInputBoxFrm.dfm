object frmqmInputBox: TfrmqmInputBox
  Left = 0
  Top = 0
  ActiveControl = txtNo
  BorderStyle = bsDialog
  Caption = #20540#24405#20837
  ClientHeight = 452
  ClientWidth = 794
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tkbMain: TTouchKeyboard
    Left = 0
    Top = 87
    Width = 794
    Height = 365
    Align = alClient
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
    CustomCaptionOverrides = {
      0100000006000000020000000645007300630004D653886D0200000012420061
      0063006B00730070006100630065000400903C68020000000654006100620004
      62634C880200000006440065006C000420526496020000000A45006E00740065
      00720004DE56668F020000000843006100700073000627590F5C9951}
  end
  object pnlToolbar: ThsGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 1
    Height = 87
    Width = 794
    object btnCancel: ThsButton
      Left = 712
      Top = 6
      Width = 80
      Height = 75
      Cancel = True
      Caption = #21462#28040'(&C)'
      Colors.Default = clWindow
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelClick
    end
    object btnChange: ThsButton
      Left = 84
      Top = 6
      Width = 80
      Height = 75
      Caption = #25968#23383'(&D)'
      Colors.Default = clWindow
      TabOrder = 1
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnChangeClick
    end
    object btnNullValue: ThsButton
      Left = 2
      Top = 6
      Width = 80
      Height = 75
      Caption = #31354#20540'(&N)'
      Colors.Default = clWindow
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnNullValueClick
    end
    object btnOK: ThsButton
      Left = 630
      Top = 6
      Width = 80
      Height = 75
      Caption = #30830#23450'(&O)'
      Colors.Default = clWindow
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnOKClick
    end
    object txtNo: ThsMaskEdit
      Left = 83
      Top = 6
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -40
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      OnKeyPress = txtNoKeyPress
      Height = 75
      Width = 546
    end
  end
  object timScanner: TTimer
    Enabled = False
    Interval = 200
    OnTimer = timScannerTimer
    Left = 192
    Top = 264
  end
  object timScannerExec: TTimer
    Enabled = False
    Interval = 100
    OnTimer = timScannerExecTimer
    Left = 272
    Top = 264
  end
end
