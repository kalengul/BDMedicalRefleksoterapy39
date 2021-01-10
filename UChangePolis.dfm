object FChangePolis: TFChangePolis
  Left = 384
  Top = 193
  Width = 327
  Height = 122
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1080#1089
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
    Width = 71
    Height = 13
    Caption = #1057#1090#1072#1088#1099#1081' '#1087#1086#1083#1080#1089
  end
  object Label2: TLabel
    Left = 176
    Top = 8
    Width = 67
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1087#1086#1083#1080#1089
  end
  object EdOldPolis: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object EdNewPolis: TEdit
    Left = 176
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtChange: TButton
    Left = 24
    Top = 56
    Width = 273
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1080#1089
    TabOrder = 2
    OnClick = BtChangeClick
  end
end
