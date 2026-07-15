object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 310
  Width = 689
  object kbmMWClientConnectionPool1: TkbmMWClientConnectionPool
    AutoActivate = False
    AutoUpdateMacros = False
    Transport = kbmMWTCPIPIndyClientTransport1
    MaxConnections = 10
    MaxCacheAge = 600
    EnableCache = True
    EnableMacros = False
    GarbageCollection = False
    Left = 105
    Top = 23
  end
  object kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    IPVersion = 4
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    TransportStateOptions = []
    MaxRetries = 1
    MaxRetriesAlternative = 0
    RequestTimeout = 600
    OnConnectionLost = kbmMWTCPIPIndyClientTransport1ConnectionLost
    OnConnected = kbmMWTCPIPIndyClientTransport1Connected
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 10
    StringConversion = mwscFixed
    Left = 257
    Top = 22
  end
  object kbmMWPooledSession1: TkbmMWPooledSession
    ConnectionPool = kbmMWClientConnectionPool1
    AutoSessionName = False
    SessionName = 'MAINDB'
    Left = 238
    Top = 151
  end
  object kbmMWCrypt1: TkbmMWCrypt
    PassPhrase = 'test'
    PassPhraseHash = mwch_sha256
    Cipher = mwcc_AES
    AutoDetect = True
    Left = 476
    Top = 25
  end
  object kbmMWLZHCompression1: TkbmMWLZHCompression
    Left = 84
    Top = 106
  end
  object kbmMWClientBriefCaseBinaryStreamFormat1: TkbmMWClientBriefCaseBinaryStreamFormat
    Version = '4.94'
    sfCalculated = []
    sfLookup = []
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfAppend = []
    sfFromStart = [sfLoadFromStart]
    Left = 248
    Top = 96
  end
  object kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat
    Version = '4.94'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    sfDisplayWidth = []
    Left = 536
    Top = 94
  end
  object kbmMWInventoryClient1: TkbmMWInventoryClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Priority = 128
    Inventory.Strings = (
      'KBMMW_INVENTORY'
      'KBMMW_QUERY')
    SelectedService = 'KBMMW_QUERY'
    InventoryService = 'KBMMW_INVENTORY'
    InventoryServiceVersion = 'kbmMW_1.0'
    Left = 97
    Top = 174
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 336
    Top = 216
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 216
    Top = 216
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 472
    Top = 216
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 608
    Top = 216
  end
  object DBManager: ThsDBManager
    Left = 407
    Top = 136
  end
  object MyTip: TdxAlertWindowManager
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'TheBezier'
    OptionsAnimate.AlphaBlendValue = 255
    OptionsAnimate.HidingAnimation = awaMove
    OptionsAnimate.HidingAnimationDirection = awmdDown
    OptionsAnimate.HidingAnimationTime = 300
    OptionsAnimate.SizeAdjustmentAnimationTime = 255
    OptionsAnimate.ShowingAnimation = awaMove
    OptionsAnimate.ShowingAnimationDirection = awmdUp
    OptionsAnimate.ShowingAnimationTime = 255
    OptionsAnimate.CollapseEmptySlotsAnimationTime = 200
    OptionsBehavior.DisplayTime = 2500
    OptionsBehavior.ScreenSnap = False
    OptionsButtons.Buttons = <>
    OptionsCaptionButtons.CaptionButtons = [awcbPin, awcbClose]
    OptionsMessage.Caption.Font.Charset = ANSI_CHARSET
    OptionsMessage.Caption.Font.Color = clYellow
    OptionsMessage.Caption.Font.Height = -15
    OptionsMessage.Caption.Font.Name = #24494#36719#38597#40657
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Text.Font.Charset = ANSI_CHARSET
    OptionsMessage.Text.Font.Color = clWhite
    OptionsMessage.Text.Font.Height = -17
    OptionsMessage.Text.Font.Name = #24494#36719#38597#40657
    OptionsMessage.Text.Font.Style = []
    OptionsMessage.Text.Font.Quality = fqClearTypeNatural
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Tahoma'
    OptionsNavigationPanel.Font.Style = []
    OptionsSize.MinHeight = 0
    OptionsSize.Width = 350
    Left = 120
    Top = 248
    PixelsPerInch = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 232
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      TextColor = 4144959
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16185078
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      TextColor = 6184542
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      TextColor = 6184542
    end
    object StyleOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 4013373
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clRed
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 3224063
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15790320
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
    end
    object cxStyle_PayType: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 1842204
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor]
      Color = 16448250
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16448250
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      TextColor = 4013373
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = clGray
    end
    object cxStyle_WhiteBk: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyleOrderDrag: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14145495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 4013373
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 8951296
    end
    object cxStyleCommision1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Pitch = fpFixed
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 4013373
    end
    object StyleEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16316661
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      TextColor = 4013373
    end
    object Style_BK: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16645629
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      Font.Quality = fqClearTypeNatural
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16645629
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15396295
      TextColor = 2697513
    end
    object SelectStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15921887
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      TextColor = 4144959
    end
    object CaiGouDStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16645629
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      TextColor = 4144959
    end
    object CaiGouDSelectStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15921887
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      TextColor = 4144959
    end
    object DingDanStyle: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16645629
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      Font.Quality = fqAntialiased
    end
    object Style_Select_35px: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15921887
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      Font.Quality = fqClearType
      TextColor = 4144959
    end
  end
end
