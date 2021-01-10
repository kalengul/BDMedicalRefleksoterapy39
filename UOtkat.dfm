object FOtkat: TFOtkat
  Left = 212
  Top = 218
  Width = 1203
  Height = 707
  Caption = #1054#1090#1082#1072#1090#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
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
    Width = 529
    Height = 639
    Align = alLeft
    TabOrder = 0
    object DBGLeft: TDBGrid
      Left = 1
      Top = 1
      Width = 527
      Height = 637
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGLeftCellClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1195
    Height = 41
    Align = alTop
    TabOrder = 1
    object BtOtk: TButton
      Left = 16
      Top = 8
      Width = 89
      Height = 25
      Caption = #1054#1090#1082#1072#1090#1080#1090#1100
      TabOrder = 0
      OnClick = BtOtkClick
    end
  end
  object Panel3: TPanel
    Left = 529
    Top = 41
    Width = 666
    Height = 639
    Align = alClient
    TabOrder = 2
    object DBGRight: TDBGrid
      Left = 1
      Top = 1
      Width = 664
      Height = 637
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
  object DataSource1: TDataSource
    DataSet = ADOQ1
    Left = 136
    Top = 97
  end
  object ADOQ1: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 176
    Top = 97
  end
  object ADOOtkat: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 176
    Top = 137
  end
  object ADOQ2: TADOQuery
    Connection = Form1.ADOC1
    Parameters = <>
    Left = 384
    Top = 97
  end
  object DataSource2: TDataSource
    DataSet = ADOQ2
    Left = 344
    Top = 97
  end
end
