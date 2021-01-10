object FAddK: TFAddK
  Left = 28
  Top = 74
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1091#1088#1089#1072
  ClientHeight = 580
  ClientWidth = 1213
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
    Width = 217
    Height = 580
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 585
    object Panel4: TPanel
      Left = 1
      Top = 153
      Width = 215
      Height = 262
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 267
      object Label8: TLabel
        Left = 8
        Top = 211
        Width = 104
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1077#1072#1085#1089#1086#1074
      end
      object Label1: TLabel
        Left = 9
        Top = 139
        Width = 79
        Height = 13
        Caption = #1064#1080#1092#1088' '#1076#1080#1072#1075#1085#1086#1079#1072
      end
      object Label7: TLabel
        Left = 9
        Top = 99
        Width = 44
        Height = 13
        Caption = #1044#1080#1072#1075#1085#1086#1079
      end
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 93
        Height = 13
        Caption = #1044#1080#1072#1075#1085#1086#1079#1099' '#1074' '#1082#1091#1088#1089#1077
      end
      object SeKolSeans: TSpinEdit
        Left = 8
        Top = 226
        Width = 185
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object CbShifrDiagnoz: TComboBox
        Left = 8
        Top = 155
        Width = 185
        Height = 21
        TabOrder = 1
        OnChange = CbShifrDiagnozChange
      end
      object CBDiagnoz: TComboBox
        Left = 8
        Top = 115
        Width = 185
        Height = 21
        TabOrder = 2
        OnChange = CBDiagnozChange
      end
      object MeDiagnoz: TMemo
        Left = 8
        Top = 23
        Width = 185
        Height = 74
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object btDiagnoz: TButton
        Left = 8
        Top = 184
        Width = 185
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1080#1072#1075#1085#1086#1079
        TabOrder = 4
        OnClick = btDiagnozClick
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 215
      Height = 152
      Align = alTop
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 104
        Width = 91
        Height = 13
        Caption = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072' '#1082#1091#1088#1089#1072
        Visible = False
      end
      object Label5: TLabel
        Left = 8
        Top = 64
        Width = 96
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1082#1091#1088#1089#1072
      end
      object DtStart: TDateTimePicker
        Left = 8
        Top = 80
        Width = 185
        Height = 21
        Date = 40326.373886018520000000
        Time = 40326.373886018520000000
        TabOrder = 0
      end
      object DtEnd: TDateTimePicker
        Left = 8
        Top = 120
        Width = 185
        Height = 21
        Date = 40326.373886018520000000
        Time = 40326.373886018520000000
        TabOrder = 1
        Visible = False
      end
      object CbKonsult: TCheckBox
        Left = 8
        Top = 16
        Width = 193
        Height = 17
        Caption = #1050#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1103
        TabOrder = 2
      end
      object CbEnd: TCheckBox
        Left = 8
        Top = 40
        Width = 193
        Height = 17
        Caption = #1047#1072#1082#1086#1085#1095#1077#1085#1085#1099#1081' '#1082#1091#1088#1089
        TabOrder = 3
        OnClick = CbEndClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 415
      Width = 215
      Height = 164
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 420
      object BtSaveTabled: TButton
        Left = 8
        Top = 91
        Width = 193
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
        TabOrder = 0
        OnClick = BtSaveTabledClick
      end
      object BtQuitAddK: TButton
        Left = 5
        Top = 131
        Width = 196
        Height = 25
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 1
        OnClick = BtQuitAddKClick
      end
      object BtDelAddP: TButton
        Left = 8
        Top = 51
        Width = 193
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1095#1082#1091
        TabOrder = 2
        OnClick = BtDelAddPClick
      end
      object BtAddK: TButton
        Left = 5
        Top = 11
        Width = 196
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 3
        OnClick = BtAddKClick
      end
    end
  end
  object Panel2: TPanel
    Left = 217
    Top = 0
    Width = 996
    Height = 580
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1004
    ExplicitHeight = 585
    object DBAddK: TDBGrid
      Left = 201
      Top = 1
      Width = 802
      Height = 583
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 200
      Height = 583
      Align = alLeft
      TabOrder = 1
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 198
        Height = 581
        Align = alClient
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 196
          Height = 24
          Align = alTop
          TabOrder = 0
          object Label3: TLabel
            Left = 0
            Top = 8
            Width = 212
            Height = 13
            Caption = #1046#1072#1083#1086#1073#1099' '#1080' '#1082#1088#1072#1090#1082#1080#1081' '#1072#1085#1072#1084#1085#1077#1079' '#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 25
          Width = 196
          Height = 280
          Align = alTop
          TabOrder = 1
          object MeAnam: TMemo
            Left = 1
            Top = 1
            Width = 194
            Height = 199
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 0
          end
          object Panel12: TPanel
            Left = 1
            Top = 200
            Width = 194
            Height = 79
            Align = alBottom
            TabOrder = 1
            object Label9: TLabel
              Left = 9
              Top = 2
              Width = 41
              Height = 13
              Caption = #1046#1072#1083#1086#1073#1072
            end
            object BtShal: TButton
              Left = 8
              Top = 48
              Width = 177
              Height = 25
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1078#1072#1083#1086#1073#1091
              TabOrder = 0
              OnClick = BtShalClick
            end
            object CbShal: TComboBox
              Left = 8
              Top = 18
              Width = 185
              Height = 21
              TabOrder = 1
              OnChange = CBDiagnozChange
            end
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 305
          Width = 196
          Height = 24
          Align = alTop
          TabOrder = 2
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 173
            Height = 13
            Caption = #1050#1088#1072#1090#1082#1080#1081' '#1101#1087#1080#1082#1088#1080#1079' '#1080' '#1088#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel10: TPanel
          Left = 1
          Top = 329
          Width = 196
          Height = 246
          Align = alClient
          TabOrder = 3
          ExplicitHeight = 251
          object MeEpic: TMemo
            Left = 1
            Top = 1
            Width = 194
            Height = 249
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQ
    Left = 265
    Top = 32
  end
  object ADOQ: TADOQuery
    Parameters = <>
    Left = 233
    Top = 32
  end
  object ADOQ1: TADOQuery
    Parameters = <>
    Left = 233
    Top = 64
  end
end
