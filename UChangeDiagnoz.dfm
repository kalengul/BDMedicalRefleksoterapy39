object FChangeDiagnoz: TFChangeDiagnoz
  Left = 54
  Top = 25
  Width = 1170
  Height = 791
  Caption = 'FChangeDiagnoz'
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
    Top = 41
    Width = 1162
    Height = 716
    Align = alClient
    TabOrder = 0
    object DbNAtDiagnoz: TDBGrid
      Left = 568
      Top = 1
      Width = 593
      Height = 714
      Align = alRight
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBDelDiagnoz: TDBGrid
      Left = 1
      Top = 1
      Width = 568
      Height = 714
      Align = alLeft
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1162
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 8
      Width = 97
      Height = 29
      Caption = #1044#1080#1072#1075#1085#1086#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 584
      Top = 8
      Width = 52
      Height = 29
      Caption = #1085#1072' ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BtGo: TButton
      Left = 336
      Top = 8
      Width = 185
      Height = 33
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtGoClick
    end
    object BtClose: TButton
      Left = 824
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 1
      OnClick = BtCloseClick
    end
  end
  object ADOQ: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 281
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOQ
    Left = 313
    Top = 112
  end
  object ADOQ1: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 569
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = ADOQ1
    Left = 601
    Top = 216
  end
  object ADOSave: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 280
    Top = 144
  end
end
