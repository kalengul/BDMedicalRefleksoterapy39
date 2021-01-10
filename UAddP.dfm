object FAddP: TFAddP
  Left = 98
  Top = 0
  Width = 868
  Height = 612
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1072#1094#1080#1077#1085#1090#1072
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
    Width = 257
    Height = 578
    Align = alLeft
    TabOrder = 0
    object Label8: TLabel
      Left = 32
      Top = 368
      Width = 111
      Height = 13
      Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    end
    object Label4: TLabel
      Left = 32
      Top = 128
      Width = 20
      Height = 13
      Caption = #1055#1086#1083
    end
    object Label3: TLabel
      Left = 32
      Top = 328
      Width = 108
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1083#1077#1095#1077#1085#1080#1103
    end
    object Label2: TLabel
      Left = 32
      Top = 248
      Width = 32
      Height = 13
      Caption = #1059#1083#1080#1094#1072
    end
    object Label1: TLabel
      Left = 32
      Top = 168
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object LePolis: TLabeledEdit
      Left = 32
      Top = 224
      Width = 185
      Height = 21
      EditLabel.Width = 73
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
      TabOrder = 0
    end
    object LeSName: TLabeledEdit
      Left = 32
      Top = 104
      Width = 185
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      TabOrder = 1
    end
    object BtAddP: TButton
      Left = 32
      Top = 416
      Width = 193
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = BtAddPClick
    end
    object LeName: TLabeledEdit
      Left = 32
      Top = 64
      Width = 185
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103
      TabOrder = 3
    end
    object Lefamily: TLabeledEdit
      Left = 32
      Top = 24
      Width = 185
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
      TabOrder = 4
    end
    object LeAdress: TLabeledEdit
      Left = 32
      Top = 304
      Width = 193
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = #1040#1076#1088#1077#1089
      TabOrder = 5
    end
    object EStreet: TComboBox
      Left = 32
      Top = 264
      Width = 185
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        '1'
        '2'
        '3')
    end
    object DTRoshd: TDateTimePicker
      Left = 32
      Top = 184
      Width = 185
      Height = 21
      Date = 0.373886018518533100
      Time = 0.373886018518533100
      TabOrder = 7
    end
    object DtNat: TDateTimePicker
      Left = 32
      Top = 344
      Width = 193
      Height = 21
      Date = 0.373886018518533100
      Time = 0.373886018518533100
      TabOrder = 8
    end
    object CbSex: TComboBox
      Left = 32
      Top = 144
      Width = 185
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = #1052#1091#1078'.'
      Items.Strings = (
        #1052#1091#1078'.'
        #1046#1077#1085'.')
    end
    object BtQuitAddP: TButton
      Left = 32
      Top = 512
      Width = 193
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 10
      OnClick = BtQuitAddPClick
    end
    object SeNomPerson: TSpinEdit
      Left = 32
      Top = 384
      Width = 193
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 11
      Value = 0
    end
    object BtSaveTabled: TButton
      Left = 32
      Top = 481
      Width = 193
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
      TabOrder = 12
      OnClick = BtSaveTabledClick
    end
    object BtDelAddP: TButton
      Left = 32
      Top = 448
      Width = 193
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1095#1082#1091
      TabOrder = 13
      OnClick = BtDelAddPClick
    end
  end
  object Panel2: TPanel
    Left = 257
    Top = 0
    Width = 603
    Height = 578
    Align = alClient
    TabOrder = 1
    object DBAddP: TDBGrid
      Left = 1
      Top = 1
      Width = 601
      Height = 576
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ADOQ: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 1
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQ
    Left = 33
    Top = 24
  end
  object ADOQ1: TADOQuery
    Connection = Form1.ADOC1
    DataSource = DataSource1
    Parameters = <>
    Left = 1
    Top = 56
  end
end
