object FAddS: TFAddS
  Left = 196
  Top = 102
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1072#1085#1089
  ClientHeight = 598
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 598
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 603
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 207
      Height = 64
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 9
        Top = 4
        Width = 104
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1077#1072#1085#1089#1086#1074
      end
      object SeKolSeans: TSpinEdit
        Left = 8
        Top = 19
        Width = 185
        Height = 22
        MaxValue = 15
        MinValue = 1
        TabOrder = 0
        Value = 15
      end
      object CbRND: TCheckBox
        Left = 8
        Top = 40
        Width = 185
        Height = 17
        Caption = #1057#1083#1091#1095#1072#1081#1085#1086#1077' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1089#1077#1072#1085#1089#1086#1074
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 65
      Width = 207
      Height = 176
      Align = alTop
      Caption = #1044#1072#1090#1099' '#1089#1077#1072#1085#1089#1086#1074
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = #1044#1072#1090#1099' '#1089' '#1091#1095#1077#1090#1086#1084' '#1074#1099#1093#1086#1076#1085#1099#1093
        TabOrder = 0
        Visible = False
      end
      object BtGetDate: TButton
        Left = 8
        Top = 40
        Width = 185
        Height = 25
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1090#1099
        TabOrder = 1
        OnClick = BtGetDateClick
      end
      object MeDate: TMemo
        Left = 8
        Top = 72
        Width = 185
        Height = 89
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 241
      Width = 207
      Height = 361
      Align = alClient
      TabOrder = 2
      object Label7: TLabel
        Left = 9
        Top = 31
        Width = 55
        Height = 13
        Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072
      end
      object Label1: TLabel
        Left = 9
        Top = 73
        Width = 87
        Height = 13
        Caption = #1064#1080#1092#1088' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
      end
      object Label9: TLabel
        Left = 8
        Top = 152
        Width = 110
        Height = 13
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
      end
      object Label10: TLabel
        Left = 8
        Top = 248
        Width = 156
        Height = 13
        Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1099' '#1074' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1089#1077#1072#1085#1089
      end
      object CBProc: TComboBox
        Left = 8
        Top = 46
        Width = 185
        Height = 21
        TabOrder = 0
        OnChange = CBProcChange
      end
      object CbShifrProc: TComboBox
        Left = 8
        Top = 92
        Width = 185
        Height = 21
        TabOrder = 1
        OnChange = CbShifrProcChange
      end
      object MeNatProc: TMemo
        Left = 8
        Top = 168
        Width = 185
        Height = 81
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object MeKonProc: TMemo
        Left = 8
        Top = 264
        Width = 185
        Height = 89
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object BtAddProc: TButton
        Left = 8
        Top = 120
        Width = 185
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1094#1077#1076#1091#1088#1091
        TabOrder = 4
        OnClick = BtAddProcClick
      end
      object CbEndSeans: TCheckBox
        Left = 8
        Top = 8
        Width = 177
        Height = 17
        Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072' '#1074' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1089#1077#1072#1085#1089
        TabOrder = 5
      end
    end
  end
  object Panel2: TPanel
    Left = 209
    Top = 0
    Width = 797
    Height = 598
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 805
    ExplicitHeight = 603
    object DbAddS: TDBGrid
      Left = 209
      Top = 1
      Width = 587
      Height = 596
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 208
      Height = 596
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 601
      object Panel4: TPanel
        Left = 1
        Top = 89
        Width = 206
        Height = 309
        Align = alTop
        TabOrder = 0
        object Label6: TLabel
          Left = 8
          Top = 32
          Width = 181
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082' '#1074#1082#1072#1078#1076#1086#1081' '#1086#1073#1083#1072#1089#1090#1080
        end
        object Label3: TLabel
          Left = 9
          Top = 75
          Width = 30
          Height = 13
          Caption = #1058#1086#1095#1082#1080
          Visible = False
        end
        object Label4: TLabel
          Left = 9
          Top = 33
          Width = 99
          Height = 13
          Caption = #1051#1086#1082#1072#1083#1080#1079#1072#1094#1080#1103' '#1090#1086#1095#1082#1080
          Visible = False
        end
        object Label11: TLabel
          Left = 8
          Top = 152
          Width = 30
          Height = 13
          Caption = #1058#1086#1095#1082#1080
        end
        object CbPoint: TComboBox
          Left = 8
          Top = 91
          Width = 185
          Height = 21
          TabOrder = 0
          Visible = False
        end
        object SEKolPoint: TSpinEdit
          Left = 8
          Top = 50
          Width = 185
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1
        end
        object CbPointLocal: TComboBox
          Left = 8
          Top = 51
          Width = 185
          Height = 21
          TabOrder = 2
          Visible = False
          OnChange = CbPointLocalChange
          Items.Strings = (
            #1053#1072' '#1090#1091#1083#1086#1074#1080#1097#1077' '#1080' '#1075#1086#1083#1086#1074#1077
            #1053#1072' '#1085#1086#1075#1072#1093
            #1053#1072' '#1088#1091#1082#1072#1093
            #1053#1072' '#1091#1096#1085#1086#1081' '#1088#1072#1082#1086#1074#1080#1085#1077)
        end
        object CbRandomPolnt: TCheckBox
          Left = 8
          Top = 8
          Width = 161
          Height = 17
          Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1077' '#1090#1086#1095#1082#1080
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object MePoint: TMemo
          Left = 8
          Top = 168
          Width = 185
          Height = 129
          ScrollBars = ssBoth
          TabOrder = 4
        end
        object BtAddPoint: TButton
          Left = 8
          Top = 120
          Width = 185
          Height = 25
          Caption = #1044#1086#1073#1072#1080#1090#1100' '#1090#1086#1095#1082#1080
          TabOrder = 5
          OnClick = BtAddPointClick
        end
      end
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 206
        Height = 88
        Align = alTop
        TabOrder = 1
        object Label2: TLabel
          Left = 3
          Top = 43
          Width = 53
          Height = 13
          Caption = #1044#1080#1085#1072#1084#1080#1082#1072
        end
        object Label5: TLabel
          Left = 1
          Top = 3
          Width = 105
          Height = 13
          Caption = #1057#1087#1086#1089#1086#1073' '#1074#1086#1079#1076#1077#1081#1089#1090#1074#1080#1103
        end
        object CbDinamika: TComboBox
          Left = 5
          Top = 59
          Width = 185
          Height = 21
          TabOrder = 0
          Text = #1059#1083#1091#1095#1096#1077#1085#1080#1077
          Items.Strings = (
            #1059#1083#1091#1095#1096#1077#1085#1080#1077
            #1041#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
            #1059#1093#1091#1076#1096#1077#1085#1080#1077)
        end
        object CbSposob: TComboBox
          Left = 5
          Top = 19
          Width = 185
          Height = 21
          TabOrder = 1
          Text = 'I/II BBM'
          Items.Strings = (
            'I/II BBM'
            'I/II BTM'
            #1043#1052)
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 395
        Width = 206
        Height = 200
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 400
        object BtSaveTabled: TButton
          Left = 8
          Top = 138
          Width = 193
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
          TabOrder = 0
          OnClick = BtSaveTabledClick
        end
        object BtQuitAddS: TButton
          Left = 5
          Top = 171
          Width = 196
          Height = 25
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          OnClick = BtQuitAddSClick
        end
        object BtDelAddP: TButton
          Left = 8
          Top = 42
          Width = 193
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1095#1082#1091
          TabOrder = 2
          OnClick = BtDelAddPClick
        end
        object BtAddK: TButton
          Left = 7
          Top = 8
          Width = 196
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 3
          OnClick = BtAddKClick
        end
        object BtSaveSeans: TButton
          Left = 10
          Top = 74
          Width = 193
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1077#1072#1085#1089#1099
          TabOrder = 4
          OnClick = BtSaveSeansClick
        end
        object BtLoadSeans: TButton
          Left = 10
          Top = 106
          Width = 193
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1077#1072#1085#1089#1099
          TabOrder = 5
          OnClick = BtLoadSeansClick
        end
      end
    end
  end
  object ADOQ: TADOQuery
    Parameters = <>
    Left = 433
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQ
    Left = 465
    Top = 16
  end
  object ADOQ1: TADOQuery
    Parameters = <>
    Left = 433
    Top = 48
  end
  object ADOQ2: TADOQuery
    Parameters = <>
    Left = 433
    Top = 80
  end
  object OpenDialog: TOpenDialog
    Left = 497
    Top = 16
  end
  object SaveDialog: TSaveDialog
    Left = 529
    Top = 16
  end
end
