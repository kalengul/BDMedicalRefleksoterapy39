object FMain: TFMain
  Left = 188
  Top = 99
  Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 884
  ClientWidth = 1192
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 482
    Align = alLeft
    TabOrder = 0
    object RgSort: TRadioGroup
      Left = 0
      Top = 274
      Width = 305
      Height = 95
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1060#1072#1084#1080#1083#1080#1103
        #1048#1084#1103
        #1054#1090#1095#1077#1089#1090#1074#1086
        #1055#1086#1083
        #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
        #1059#1083#1080#1094#1072
        #1040#1076#1088#1077#1089
        #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1073#1089#1083'.'
        #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1091#1088#1089#1086#1074
        #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088)
      TabOrder = 0
      OnClick = RgSortClick
    end
    object Panel5: TPanel
      Left = 1
      Top = 121
      Width = 303
      Height = 152
      Align = alTop
      TabOrder = 1
      object Label4: TLabel
        Left = 153
        Top = 40
        Width = 32
        Height = 13
        Caption = #1059#1083#1080#1094#1072
      end
      object Label3: TLabel
        Left = 11
        Top = 80
        Width = 124
        Height = 13
        Caption = #1050#1086#1083'. '#1087#1088#1086#1081#1076#1077#1085#1085#1099#1093' '#1082#1091#1088#1089#1086#1074
      end
      object Label2: TLabel
        Left = 11
        Top = 40
        Width = 32
        Height = 13
        Caption = #1055#1086#1083#1080#1089
      end
      object Label11: TLabel
        Left = 152
        Top = 2
        Width = 20
        Height = 13
        Caption = #1055#1086#1083
      end
      object Label6: TLabel
        Left = 12
        Top = 0
        Width = 49
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label5: TLabel
        Left = 151
        Top = 80
        Width = 111
        Height = 13
        Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object Label8: TLabel
        Left = 173
        Top = 133
        Width = 122
        Height = 13
        Caption = ' '#1085#1077' '#1079#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077' '#1082#1091#1088#1089#1099
      end
      object EPolis: TEdit
        Left = 9
        Top = 56
        Width = 136
        Height = 21
        TabOrder = 0
        OnChange = ENomPersonChange
      end
      object EFamily: TEdit
        Left = 9
        Top = 16
        Width = 136
        Height = 21
        TabOrder = 1
        OnChange = ENomPersonChange
      end
      object EStreet: TEdit
        Left = 152
        Top = 56
        Width = 137
        Height = 21
        TabOrder = 2
        OnChange = ENomPersonChange
      end
      object ESex: TComboBox
        Left = 152
        Top = 16
        Width = 57
        Height = 21
        TabOrder = 3
        OnChange = ESexChange
        Items.Strings = (
          #1052#1091#1078'.'
          #1046#1077#1085'.')
      end
      object EKolKyrs: TSpinEdit
        Left = 8
        Top = 96
        Width = 137
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = -1
        OnChange = ENomPersonChange
      end
      object ENomPerson: TSpinEdit
        Left = 152
        Top = 96
        Width = 137
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = -1
        OnChange = ENomPersonChange
      end
      object CbPeopleNezKurs: TCheckBox
        Left = 8
        Top = 118
        Width = 297
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077#1093' '#1083#1102#1076#1077#1081', '#1091' '#1082#1086#1090#1086#1088#1099#1093' '#1077#1089#1090#1100
        TabOrder = 6
        OnClick = ENomPersonChange
      end
      object BtAddSexBase: TButton
        Left = 215
        Top = 16
        Width = 72
        Height = 19
        Caption = #1056#1072#1089#1089#1090#1072#1074#1080#1090#1100
        TabOrder = 7
        OnClick = BtAddSexBaseClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 303
      Height = 120
      Align = alTop
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' ...'
      TabOrder = 2
      object CbVisible: TCheckListBox
        Left = 2
        Top = 15
        Width = 299
        Height = 103
        OnClickCheck = CbVisibleClickCheck
        Align = alClient
        Columns = 2
        ItemHeight = 13
        Items.Strings = (
          #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
          #1060#1072#1084#1080#1083#1080#1103
          #1048#1084#1103
          #1054#1090#1095#1077#1089#1090#1074#1086
          #1055#1086#1083
          #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
          #1059#1083#1080#1094#1072
          #1040#1076#1088#1077#1089
          #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1073#1089#1083'.'
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1091#1088#1089#1086#1074)
        TabOrder = 0
      end
    end
    object BtAdd: TButton
      Left = 8
      Top = 440
      Width = 129
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
      TabOrder = 3
      OnClick = BtAddClick
    end
    object BtKolis: TButton
      Left = 168
      Top = 440
      Width = 129
      Height = 25
      Caption = #1056#1072#1089#1089#1084#1086#1090#1088#1077#1090#1100' '#1082#1086#1083#1083#1080#1079#1080#1080
      TabOrder = 4
      OnClick = BtKolisClick
    end
    object BtChangePolis: TButton
      Left = 8
      Top = 376
      Width = 97
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1080#1089
      TabOrder = 5
      OnClick = BtChangePolisClick
    end
    object BtChangeNAme: TButton
      Left = 112
      Top = 376
      Width = 81
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1084#1103
      TabOrder = 6
      OnClick = BtChangeNAmeClick
    end
    object BtChangeSNAme: TButton
      Left = 200
      Top = 376
      Width = 105
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1092#1072#1084#1080#1083#1080#1102
      TabOrder = 7
      OnClick = BtChangeSNAmeClick
    end
    object BtOtkat: TButton
      Left = 8
      Top = 408
      Width = 129
      Height = 25
      Caption = #1054#1090#1082#1072#1090#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 8
      OnClick = BtOtkatClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 515
    Width = 1192
    Height = 369
    Align = alBottom
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 304
      Height = 367
      Align = alLeft
      TabOrder = 0
      object BtSeans: TButton
        Left = 9
        Top = 279
        Width = 289
        Height = 25
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1077#1072#1085#1089#1099' '#1082#1091#1088#1089#1072
        TabOrder = 0
        OnClick = BtSeansClick
      end
      object BtKyrsEnd: TButton
        Left = 8
        Top = 248
        Width = 153
        Height = 25
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1082#1091#1088#1089
        TabOrder = 1
        OnClick = BtKyrsEndClick
      end
      object BtAddKarta: TButton
        Left = 144
        Top = 337
        Width = 153
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1072#1088#1090#1091' '#1087#1072#1094#1080#1077#1085#1090#1072
        TabOrder = 2
        OnClick = BtAddKartaClick
      end
      object BtIsprDiagnoz: TButton
        Left = 8
        Top = 336
        Width = 129
        Height = 25
        Caption = #1048#1089#1087#1088#1072#1080#1090#1100' '#1076#1080#1072#1075#1085#1086#1079#1099
        TabOrder = 3
        OnClick = BtIsprDiagnozClick
      end
      object BtAddKartaArhive: TButton
        Left = 144
        Top = 308
        Width = 153
        Height = 26
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1072#1088#1090#1091' '#1087#1072#1094#1080#1077#1085#1090#1072
        TabOrder = 4
        OnClick = BtAddKartaArhiveClick
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 302
        Height = 241
        Align = alTop
        TabOrder = 5
        object Panel18: TPanel
          Left = 1
          Top = 1
          Width = 300
          Height = 64
          Align = alTop
          TabOrder = 0
          object BtDateStartKart: TButton
            Left = 6
            Top = 36
            Width = 106
            Height = 25
            Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1072#1088#1090#1099
            TabOrder = 0
          end
          object CbDateStartKyrs: TComboBox
            Left = 140
            Top = 38
            Width = 145
            Height = 21
            TabOrder = 1
          end
          object BtDateStartKartArhiv: TButton
            Left = 6
            Top = 5
            Width = 106
            Height = 25
            Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1072#1088#1090#1099
            TabOrder = 2
          end
          object CbDateStartKyrsArhiv: TComboBox
            Left = 140
            Top = 7
            Width = 145
            Height = 21
            TabOrder = 3
          end
        end
      end
      object BtAddKyrs: TButton
        Left = 171
        Top = 249
        Width = 129
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1091#1088#1089
        TabOrder = 6
        OnClick = BtAddKyrsClick
      end
    end
    object Panel8: TPanel
      Left = 783
      Top = 1
      Width = 408
      Height = 367
      Align = alRight
      TabOrder = 1
      object Panel9: TPanel
        Left = 218
        Top = 177
        Width = 189
        Height = 189
        Align = alRight
        TabOrder = 0
        object MeEpicriz: TMemo
          Left = 1
          Top = 1
          Width = 187
          Height = 187
          Align = alClient
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
      object Panel12: TPanel
        Left = 1
        Top = 1
        Width = 406
        Height = 176
        Align = alTop
        TabOrder = 1
        object Panel13: TPanel
          Left = 1
          Top = 143
          Width = 404
          Height = 32
          Align = alBottom
          TabOrder = 0
          object Label16: TLabel
            Left = 52
            Top = 2
            Width = 90
            Height = 26
            Caption = #1040#1085#1072#1084#1085#1077#1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 268
            Top = 3
            Width = 86
            Height = 26
            Caption = #1069#1087#1080#1082#1088#1080#1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel14: TPanel
          Left = 223
          Top = 1
          Width = 182
          Height = 142
          Align = alRight
          TabOrder = 1
          object MMetod: TMemo
            Left = 1
            Top = 1
            Width = 180
            Height = 140
            Align = alClient
            TabOrder = 0
          end
        end
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 222
          Height = 142
          Align = alClient
          TabOrder = 2
          object MDiagnoz: TMemo
            Left = 1
            Top = 1
            Width = 220
            Height = 140
            Align = alClient
            Lines.Strings = (
              '')
            TabOrder = 0
          end
        end
      end
      object MeAnamnez: TMemo
        Left = 1
        Top = 177
        Width = 217
        Height = 189
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 2
      end
    end
    object Panel16: TPanel
      Left = 305
      Top = 1
      Width = 478
      Height = 367
      Align = alClient
      Caption = 'Panel16'
      TabOrder = 2
      object DbKyrs: TDBGrid
        Left = 1
        Top = 121
        Width = 476
        Height = 245
        Align = alClient
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DbKyrsCellClick
      end
      object Panel17: TPanel
        Left = 1
        Top = 1
        Width = 476
        Height = 120
        Align = alTop
        Caption = 'Panel17'
        TabOrder = 1
        object DBArhiv: TDBGrid
          Left = 1
          Top = 1
          Width = 474
          Height = 118
          Align = alClient
          DataSource = DataSource3
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 305
    Top = 0
    Width = 887
    Height = 482
    Align = alClient
    TabOrder = 2
    object Db: TDBGrid
      Left = 1
      Top = 1
      Width = 885
      Height = 480
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DbCellClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 482
    Width = 1192
    Height = 33
    Align = alBottom
    TabOrder = 3
    object Label1: TLabel
      Left = 312
      Top = 0
      Width = 48
      Height = 26
      Caption = #1050#1091#1088#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LaDlit: TLabel
      Left = 264
      Top = 0
      Width = 6
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel10: TPanel
      Left = 783
      Top = 1
      Width = 408
      Height = 31
      Align = alRight
      TabOrder = 0
      object Label13: TLabel
        Left = 44
        Top = 2
        Width = 104
        Height = 26
        Caption = #1044#1080#1072#1075#1085#1086#1079#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel11: TPanel
        Left = 222
        Top = 1
        Width = 185
        Height = 29
        Align = alRight
        TabOrder = 0
        object Label15: TLabel
          Left = 9
          Top = 0
          Width = 154
          Height = 26
          Caption = #1042#1089#1077' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object BtSaveOt: TButton
      Left = 168
      Top = 5
      Width = 129
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1095#1077#1090
      TabOrder = 1
      OnClick = BtSaveOtClick
    end
    object BtLoad: TButton
      Left = 8
      Top = 5
      Width = 145
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      TabOrder = 2
      OnClick = BtLoadClick
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQ
    Left = 345
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ADOQKyrs
    Left = 344
    Top = 56
  end
  object ADOC1: TADOConnection
    LoginPrompt = False
    Left = 281
    Top = 24
  end
  object ADOQ: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 313
    Top = 24
  end
  object ADOQKyrs: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 312
    Top = 56
  end
  object ADOSave: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 312
    Top = 96
  end
  object ADODS: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 313
    Top = 136
  end
  object ADOS1: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 313
    Top = 176
  end
  object ADOQKyrsA: TADOQuery
    Connection = ADOC1
    Parameters = <>
    Left = 384
    Top = 56
  end
  object DataSource3: TDataSource
    DataSet = ADOQKyrsA
    Left = 424
    Top = 56
  end
end
