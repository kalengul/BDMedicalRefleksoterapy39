unit UAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UMainForm, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls,
  ComCtrls, DBCtrls, Spin;

type
  TFAdd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    ADOQAddK: TADOQuery;
    DataSource1: TDataSource;
    ADOQAddP: TADOQuery;
    DataSource2: TDataSource;
    ADOQAddS: TADOQuery;
    DataSource3: TDataSource;
    GroupBox1: TGroupBox;
    Lefamily: TLabeledEdit;
    LeName: TLabeledEdit;
    LeSName: TLabeledEdit;
    LePolis: TLabeledEdit;
    LeAdress: TLabeledEdit;
    DTRoshd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DtNat: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    CbSex: TComboBox;
    EStreet: TEdit;
    GroupBox2: TGroupBox;
    DtStart: TDateTimePicker;
    Label5: TLabel;
    DtEnd: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    DBCBDiagnoz: TDBComboBox;
    CbKonsult: TCheckBox;
    Label8: TLabel;
    SeNomPerson: TSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAdd: TFAdd;

implementation

{$R *.dfm}

Procedure ReBaseAddP;
  begin
  With FAdd do begin
  AdoQAddP.Close;
  ADOQAddP.SQL.Clear;
  ADOQAddP.SQL.Add('Select Id_Person, Nom_Person, Family, Name, SName, Sex, Date_Rozhd, Nom_Polis, Name_Street, Address, Date_Nat, Kol_Kyrs');
  ADOQAddP.SQL.Add('from TPerson, TStreet');
  ADOQAddP.SQL.Add('Where Id_Street=Street');
  If LEFamily.Text<>'' then
    ADOQAddP.SQL.Add('and Family Like '+Chr(39)+LEFamily.Text+'%'+Chr(39));
  If LEName.Text<>'' then
    ADOQAddP.SQL.Add('and Name Like '+Chr(39)+LEName.Text+'%'+Chr(39));
  If LESName.Text<>'' then
    ADOQAddP.SQL.Add('and SName Like '+Chr(39)+LESName.Text+'%'+Chr(39));
  If CbSex.Text<>'' then
    ADOQAddP.SQL.Add('and Sex = '+Chr(39)+CbSex.Text+Chr(39));
  If LEPolis.Text<>'' then
    ADOQAddP.SQL.Add('and Nom_Polis Like '+Chr(39)+LEPolis.Text+'%'+Chr(39));
  If EStreet.Text<>'' then
    ADOQAddP.SQL.Add('and Name_Street Like '+Chr(39)+EStreet.Text+'%'+Chr(39));
  If LEAdress.Text<>'' then
    ADOQAddP.SQL.Add('and Address Like '+Chr(39)+LEAdress.Text+'%'+Chr(39));
  If DateToStr(DtNat.Date)<>'30.12.1899' then
    ADOQAddP.SQL.Add('and Date_Nat = '+Chr(39)+DateToStr(DtNat.Date)+Chr(39));
  If DateToStr(DtRoshd.Date)<>'30.12.1899' then
    ADOQAddP.SQL.Add('and Date_Rozhd = '+Chr(39)+DateToStr(DTRoshd.Date)+Chr(39));
  If SENomPerson.Value<>-1 then
    ADOQAddP.SQL.Add('and Nom_Person = '+IntToStr(SENomPerson.Value));
  ADOQAddP.Open;
  end;
  end;

Procedure ReBaseAddK;
  begin
  With FAdd do begin
  AdoQAddP.Close;
  ADOQAddP.SQL.Clear;
  ADOQAddP.SQL.Add('Select Konsult, DateStart_Kyrs, DateEnd_Kyrs, Kol_seans, Diagnoz');
  ADOQAddP.SQL.Add('from TPerson, TStreet');
  ADOQAddP.SQL.Add('Where Id_Street=Street');
  If LEFamily.Text<>'' then
    ADOQAddP.SQL.Add('and Family Like '+Chr(39)+LEFamily.Text+'%'+Chr(39));
  If LEName.Text<>'' then
    ADOQAddP.SQL.Add('and Name Like '+Chr(39)+LEName.Text+'%'+Chr(39));
  If LESName.Text<>'' then
    ADOQAddP.SQL.Add('and SName Like '+Chr(39)+LESName.Text+'%'+Chr(39));
  If CbSex.Text<>'' then
    ADOQAddP.SQL.Add('and Sex = '+Chr(39)+CbSex.Text+Chr(39));
  If LEPolis.Text<>'' then
    ADOQAddP.SQL.Add('and Nom_Polis Like '+Chr(39)+LEPolis.Text+'%'+Chr(39));
  If EStreet.Text<>'' then
    ADOQAddP.SQL.Add('and Name_Street Like '+Chr(39)+EStreet.Text+'%'+Chr(39));
  If LEAdress.Text<>'' then
    ADOQAddP.SQL.Add('and Address Like '+Chr(39)+LEAdress.Text+'%'+Chr(39));
  If DateToStr(DtNat.Date)<>'30.12.1899' then
    ADOQAddP.SQL.Add('and Date_Nat = '+Chr(39)+DateToStr(DtNat.Date)+Chr(39));
  If DateToStr(DtRoshd.Date)<>'30.12.1899' then
    ADOQAddP.SQL.Add('and Date_Rozhd = '+Chr(39)+DateToStr(DTRoshd.Date)+Chr(39));
  If SENomPerson.Value<>-1 then
    ADOQAddP.SQL.Add('and Nom_Person = '+IntToStr(SENomPerson.Value));
  ADOQAddP.Open;
  end;
  end;

end.
