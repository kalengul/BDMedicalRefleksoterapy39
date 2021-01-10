object FSeans: TFSeans
  Left = 196
  Top = 184
  Caption = #1057#1077#1072#1085#1089#1099
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 561
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 862
    ExplicitHeight = 566
    object DbSeans: TDBGrid
      Left = 185
      Top = 1
      Width = 676
      Height = 564
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DbSeansCellClick
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 184
      Height = 564
      Align = alLeft
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 280
        Width = 71
        Height = 29
        Caption = #1058#1086#1095#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 88
        Width = 126
        Height = 29
        Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BtAddKyrs: TButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1072#1085#1089
        TabOrder = 0
        OnClick = BtAddKyrsClick
      end
      object Panel1: TPanel
        Left = 1
        Top = 320
        Width = 182
        Height = 243
        Align = alBottom
        TabOrder = 1
        object MPoint: TMemo
          Left = 1
          Top = 1
          Width = 180
          Height = 241
          Align = alClient
          TabOrder = 0
        end
      end
      object BtExit: TButton
        Left = 8
        Top = 40
        Width = 129
        Height = 25
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 2
        OnClick = BtExitClick
      end
      object MeProc: TMemo
        Left = 8
        Top = 120
        Width = 169
        Height = 161
        TabOrder = 3
      end
    end
  end
  object ADOQSeans: TADOQuery
    Parameters = <>
    Left = 312
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = ADOQSeans
    Left = 344
    Top = 56
  end
  object ADOQT: TADOQuery
    Parameters = <>
    Left = 312
    Top = 88
  end
end
