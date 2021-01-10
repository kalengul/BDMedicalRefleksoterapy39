object FLoad: TFLoad
  Left = 306
  Top = 259
  Width = 500
  Height = 257
  Caption = 'FLoad'
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
    Width = 276
    Height = 24
    Caption = #1047#1072#1075#1088#1091#1079#1082#1072#1073#1091#1076#1077#1090' '#1080#1079' '#1101#1090#1086#1075#1086' '#1092#1072#1081#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RgOt: TRadioGroup
    Left = 24
    Top = 88
    Width = 449
    Height = 57
    Caption = #1047#1072#1075#1088#1091#1079#1082#1072
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #1050#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080
      #1054#1090#1095#1077#1090
      #1057#1090#1088#1072#1093#1086#1074#1072#1103)
    TabOrder = 0
  end
  object BtLoadOt: TButton
    Left = 24
    Top = 152
    Width = 97
    Height = 57
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 1
    OnClick = BtLoadOtClick
  end
  object btExitOt: TButton
    Left = 376
    Top = 152
    Width = 97
    Height = 57
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = btExitOtClick
  end
  object LeLoad: TLabeledEdit
    Left = 184
    Top = 176
    Width = 121
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = #1047#1072#1075#1088#1091#1078#1072#1077#1090#1089#1103
    TabOrder = 3
  end
  object ADOQ: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 80
  end
  object ADOSave: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 48
  end
  object ADOQ1: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 112
  end
end
