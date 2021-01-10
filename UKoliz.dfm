object FKoliz: TFKoliz
  Left = 647
  Top = 147
  Caption = 'FKoliz'
  ClientHeight = 561
  ClientWidth = 854
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
    Width = 854
    Height = 561
    Align = alClient
    TabOrder = 0
    object DbKolis: TDBGrid
      Left = 1
      Top = 1
      Width = 852
      Height = 306
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DbKolisCellClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 347
      Width = 852
      Height = 213
      Align = alBottom
      Caption = 'Panel3'
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 850
        Height = 211
        Align = alClient
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
      Top = 307
      Width = 852
      Height = 40
      Align = alBottom
      TabOrder = 2
      object Label1: TLabel
        Left = 248
        Top = 8
        Width = 228
        Height = 24
        Caption = #1057' '#1082#1077#1084' '#1074#1086#1079#1085#1080#1082#1083#1080' '#1082#1086#1083#1083#1080#1079#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BtYstrKolis: TButton
        Left = 488
        Top = 8
        Width = 121
        Height = 25
        Caption = #1059#1089#1090#1088#1072#1085#1080#1090#1100
        TabOrder = 0
        OnClick = BtYstrKolisClick
      end
    end
  end
  object ADOQ: TADOQuery
    Connection = Form1.ADOC1
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
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 441
    Top = 384
  end
  object DataSource2: TDataSource
    DataSet = ADOQ1
    Left = 473
    Top = 384
  end
  object ADOSave: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 432
    Top = 48
  end
end
