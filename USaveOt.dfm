object FSaveOt: TFSaveOt
  Left = 338
  Top = 160
  Width = 497
  Height = 311
  Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 445
    Height = 37
    Caption = #1055#1088#1086#1074#1077#1088#1100#1090#1077' '#1086#1090#1082#1088#1099#1090' '#1083#1080' Ms EXEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 48
    Width = 356
    Height = 24
    Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1074' '#1101#1090#1086#1090' '#1092#1072#1081#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 168
    Width = 33
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object Label4: TLabel
    Left = 24
    Top = 168
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
    Visible = False
  end
  object RgOt: TRadioGroup
    Left = 24
    Top = 104
    Width = 449
    Height = 57
    Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #1050#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080
      #1057#1090#1088#1072#1093#1086#1074#1072#1103
      #1054#1090#1095#1077#1090)
    TabOrder = 0
  end
  object BtsaveOt: TButton
    Left = 24
    Top = 216
    Width = 97
    Height = 57
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = BtsaveOtClick
  end
  object btExitOt: TButton
    Left = 376
    Top = 216
    Width = 97
    Height = 57
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = btExitOtClick
  end
  object LeGod: TLabeledEdit
    Left = 160
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = #1043#1086#1076
    TabOrder = 3
    Text = '2010'
  end
  object CbMesats: TComboBox
    Left = 24
    Top = 184
    Width = 121
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = #1071#1085#1074#1072#1088#1100
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1052#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
  object CbGodOtchet: TCheckBox
    Left = 24
    Top = 80
    Width = 97
    Height = 17
    Caption = #1043#1086#1076#1086#1074#1086#1081' '#1086#1090#1095#1077#1090
    TabOrder = 5
    OnClick = CbGodOtchetClick
  end
  object RgGodOt: TRadioGroup
    Left = 24
    Top = 104
    Width = 449
    Height = 57
    Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1094#1077#1076#1091#1088
      #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1089#1077#1097#1077#1085#1080#1081)
    TabOrder = 6
    Visible = False
  end
  object CbDay: TCheckBox
    Left = 248
    Top = 80
    Width = 217
    Height = 17
    Caption = #1045#1078#1077#1076#1085#1077#1074#1085#1099#1081' '#1091#1095#1077#1090' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
    TabOrder = 7
    OnClick = CbDayClick
  end
  object DTPDate: TDateTimePicker
    Left = 24
    Top = 184
    Width = 129
    Height = 21
    Date = 40708.000000000000000000
    Time = 40708.000000000000000000
    TabOrder = 8
    Visible = False
  end
  object btSave1: TButton
    Left = 24
    Top = 215
    Width = 97
    Height = 57
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 9
    Visible = False
    OnClick = btSave1Click
  end
  object ADOSave: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 48
  end
  object ADOQ: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 80
  end
  object ADOQ1: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 112
  end
end
