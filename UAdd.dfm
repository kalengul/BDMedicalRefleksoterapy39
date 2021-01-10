object FAdd: TFAdd
  Left = 172
  Top = 137
  Width = 1089
  Height = 816
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 782
    Align = alLeft
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 217
      Height = 425
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'('#1087#1086#1080#1089#1082') '#1087#1072#1094#1080#1077#1085#1090#1072
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 176
        Width = 79
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object Label2: TLabel
        Left = 8
        Top = 256
        Width = 32
        Height = 13
        Caption = #1059#1083#1080#1094#1072
      end
      object Label3: TLabel
        Left = 8
        Top = 336
        Width = 108
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1083#1077#1095#1077#1085#1080#1103
      end
      object Label4: TLabel
        Left = 8
        Top = 136
        Width = 20
        Height = 13
        Caption = #1055#1086#1083
      end
      object Label8: TLabel
        Left = 8
        Top = 376
        Width = 111
        Height = 13
        Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object Lefamily: TLabeledEdit
        Left = 8
        Top = 32
        Width = 185
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
        TabOrder = 0
      end
      object LeName: TLabeledEdit
        Left = 8
        Top = 72
        Width = 185
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = #1048#1084#1103
        TabOrder = 1
      end
      object LeSName: TLabeledEdit
        Left = 8
        Top = 112
        Width = 185
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        TabOrder = 2
      end
      object LePolis: TLabeledEdit
        Left = 8
        Top = 232
        Width = 185
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
        TabOrder = 3
      end
      object LeAdress: TLabeledEdit
        Left = 8
        Top = 312
        Width = 193
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = #1040#1076#1088#1077#1089
        TabOrder = 4
      end
      object DTRoshd: TDateTimePicker
        Left = 8
        Top = 192
        Width = 185
        Height = 21
        Date = 0.373886018518533100
        Time = 0.373886018518533100
        TabOrder = 5
      end
      object DtNat: TDateTimePicker
        Left = 8
        Top = 352
        Width = 193
        Height = 21
        Date = 0.373886018518533100
        Time = 0.373886018518533100
        TabOrder = 6
      end
      object CbSex: TComboBox
        Left = 8
        Top = 152
        Width = 185
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 7
        Text = #1052#1091#1078'.'
        Items.Strings = (
          #1052#1091#1078'.'
          #1046#1077#1085'.')
      end
      object EStreet: TEdit
        Left = 8
        Top = 272
        Width = 185
        Height = 21
        TabOrder = 8
      end
      object SeNomPerson: TSpinEdit
        Left = 8
        Top = 392
        Width = 193
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 9
        Value = -1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 472
      Width = 225
      Height = 177
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1091#1088#1089#1072
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 96
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1082#1091#1088#1089#1072
      end
      object Label6: TLabel
        Left = 8
        Top = 80
        Width = 91
        Height = 13
        Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072' '#1082#1091#1088#1089#1072
      end
      object Label7: TLabel
        Left = 9
        Top = 121
        Width = 44
        Height = 13
        Caption = #1044#1080#1072#1075#1085#1086#1079
      end
      object DtStart: TDateTimePicker
        Left = 8
        Top = 56
        Width = 185
        Height = 21
        Date = 40326.373886018520000000
        Time = 40326.373886018520000000
        TabOrder = 0
      end
      object DtEnd: TDateTimePicker
        Left = 8
        Top = 96
        Width = 185
        Height = 21
        Date = 40326.373886018520000000
        Time = 40326.373886018520000000
        TabOrder = 1
      end
      object DBCBDiagnoz: TDBComboBox
        Left = 8
        Top = 136
        Width = 185
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
      object CbKonsult: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1103
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 241
    Top = 0
    Width = 840
    Height = 782
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 416
      Width = 838
      Height = 192
      Align = alBottom
      TabOrder = 0
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 836
        Height = 190
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
    object Panel4: TPanel
      Left = 1
      Top = 608
      Width = 838
      Height = 173
      Align = alBottom
      TabOrder = 1
      object DBGrid3: TDBGrid
        Left = 1
        Top = 1
        Width = 836
        Height = 171
        Align = alClient
        DataSource = DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 838
      Height = 415
      Align = alClient
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 836
        Height = 413
        Align = alClient
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object ADOQAddK: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 313
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOQAddK
    Left = 345
    Top = 56
  end
  object ADOQAddP: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 313
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ADOQAddP
    Left = 345
    Top = 24
  end
  object ADOQAddS: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 313
    Top = 88
  end
  object DataSource3: TDataSource
    DataSet = ADOQAddS
    Left = 345
    Top = 88
  end
end
