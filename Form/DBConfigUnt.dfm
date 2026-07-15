object fmDBConfig: TfmDBConfig
  Left = 399
  Top = 300
  ActiveControl = edtServerName
  BorderIcons = []
  Caption = #35774#32622#36830#25509
  ClientHeight = 238
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 94
    Top = 7
    Width = 322
    Height = 180
    Shape = bsBottomLine
  end
  object lblServerName: ThsLabel
    Left = 108
    Top = 40
    Caption = #26381#21153#22120#21517
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object lblServerPort: ThsLabel
    Left = 108
    Top = 66
    Caption = #31471#12288#12288#21475
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object edtServerName: ThsTextEdit
    Left = 170
    Top = 41
    TabOrder = 4
    Width = 221
  end
  object edtServerPort: ThsTextEdit
    Left = 170
    Top = 66
    TabOrder = 6
    Width = 221
  end
  object BtnOK: TcxButton
    Left = 199
    Top = 196
    Width = 81
    Height = 27
    Caption = #30830#23450
    LookAndFeel.NativeStyle = False
    TabOrder = 10
    OnClick = BtnOKClick
  end
  object BtnCancel: TcxButton
    Left = 287
    Top = 196
    Width = 82
    Height = 27
    Cancel = True
    Caption = #21462#28040
    LookAndFeel.NativeStyle = False
    ModalResult = 2
    TabOrder = 11
  end
  object lblServiceName: ThsLabel
    Left = 108
    Top = 17
    Caption = #36134#12288#12288#22871
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cbbServiceName: ThsComboBox
    Left = 170
    Top = 16
    Properties.DropDownListStyle = lsFixedList
    Properties.ImmediatePost = True
    TabOrder = 1
    OnEnter = cbbServiceNameEnter
    Width = 221
  end
  object imgServer: ThsImage
    Left = 1
    Top = 1
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000064
      000000640803000000473C6566000000097048597300000EC400000EC401952B
      0E1B000000DB504C5445FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000003333334040403737374141413232327A7A7A
      8080807676768383837B7B7B0000003C3C3C4A4A4A3838384848483434344444
      447474747777778181817D7D7D3939393B3B3B12E72B4646464545453535353A
      3A3A4343433D3D3D15D52C2F302F3030304242427C7C7C7979797E7E7E313131
      4B4B4B3636368282827575753E3E3E4747477F7F7F3F3F3F1CAB2D26732F1DAB
      2D333433228D2E25722E208B2D27743025712E1DAC2E1CAA2C15D52B49494978
      787832333238E52DFE0000000C74524E53000A1E3B07141B0903012735EA693D
      040000014649444154785EEDDA476EC3301445D14851B3ADDEBB7B6FE9BDF7FD
      AF286414CF32500808048C7717F00F24517FC4035EB5344915985225AD5513D1
      84903941AB8948727812C7F107294DD3CBD1683CCEF37C365B5B966118D717F3
      79144583E9B4DF4F92C4344F27934946D275DD0E65A926A22AEC88A2D6440491
      207474357CBDB668743C993FAFC6F7E9F46ABC6EDBF63169B5228828FC0BF17D
      FF8CD6ED765DD7BD221DF57ABDCD66130481E338DB4F5259969EE79DD38AA260
      41800001C2FF8F67DC5D1C9F04A70B0810EC2EEC2E2040806077ED1D02040810
      20408000013230753B4B1A458CAFDBBBC5E2E671396810B97F18FEF4B46C0E89
      9E87BFBD988D21C9EB0E79D31B43B2C50E795F714038BC2ECE1F9EFD08F3FF19
      D9D7CADE6F61204080000102040810550959AB7F614992DB9D43A63AEDDA57AF
      34415644A614F9CF4B64DFD7A5DEF739EEE00E0000000049454E44AE426082}
    Properties.PopupMenuLayout.MenuItems = []
    Properties.ReadOnly = True
    Properties.ShowFocusRect = False
    Style.BorderStyle = ebsNone
    StyleDisabled.BorderStyle = ebsNone
    StyleFocused.BorderStyle = ebsNone
    StyleHot.BorderStyle = ebsNone
    TabOrder = 0
    Transparent = True
    Height = 129
    Width = 90
  end
  object lblFallbackServers: ThsLabel
    Left = 108
    Top = 89
    Caption = #22791#29992#22320#22336
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object memFallbackServers: ThsMemo
    Left = 169
    Top = 91
    Properties.ScrollBars = ssVertical
    TabOrder = 8
    Height = 70
    Width = 222
  end
  object lblInfo: ThsLabel
    Left = 169
    Top = 163
    Caption = #26684#24335#65306#26381#21153#22120#21517'1:'#31471#21475'1;'#26381#21153#22120#21517'2:'#31471#21475'2'
    Transparent = True
  end
  object kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    IPVersion = 4
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 600
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 40
    Top = 184
  end
  object kbmMWSimpleClient1: TkbmMWSimpleClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Username = 'EE'
    Priority = 128
    Left = 72
    Top = 184
  end
end
