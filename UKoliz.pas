unit UKoliz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TFKoliz = class(TForm)
    Panel1: TPanel;
    DbKolis: TDBGrid;
    ADOQ: TADOQuery;
    DataSource1: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    ADOQ1: TADOQuery;
    DataSource2: TDataSource;
    BtYstrKolis: TButton;
    ADOSave: TADOQuery;
    procedure FormActivate(Sender: TObject);
    procedure DbKolisCellClick(Column: TColumn);
    procedure BtYstrKolisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKoliz: TFKoliz;

implementation

{$R *.dfm}

Procedure ReBaseKolisNom;
  begin
  With FKoliz do begin
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select Id_Person, Family, Name, SName, Date_Rozhd, Nom_Polis');
  ADOQ1.SQL.Add('From TPerson');
  ADOQ1.SQL.Add('Where Family = '+Chr(39)+ADOQ.Fields[0].AsString+Chr(39));
  ADOQ1.SQL.Add(  'and Name = '+Chr(39)+ADOQ.Fields[1].AsString+Chr(39));
  ADOQ1.SQL.Add(  'and SName = '+Chr(39)+ADOQ.Fields[2].AsString+Chr(39));
  ADOQ1.SQL.Add(  'and (Nom_Polis <> '+Chr(39)+ADOQ.Fields[4].AsString+Chr(39));
  ADOQ1.SQL.Add(  'or Date_Rozhd <> '+Chr(39)+ADOQ.Fields[3].AsString+Chr(39)+')');
  ADOQ1.SQL.Add(  'or Nom_Polis = '+Chr(39)+ADOQ.Fields[4].AsString+Chr(39));
  ADOQ1.SQL.Add(  'and (Family <> '+Chr(39)+ADOQ.Fields[1].AsString+Chr(39));
  ADOQ1.SQL.Add(  'or Name <> '+Chr(39)+ADOQ.Fields[2].AsString+Chr(39));
  ADOQ1.SQL.Add(  'or SName <> '+Chr(39)+ADOQ.Fields[3].AsString+Chr(39));
  ADOQ1.SQL.Add(  'or Date_Rozhd <> '+Chr(39)+ADOQ.Fields[4].AsString+Chr(39)+')');
  ADOQ1.SQL.Add( 'ORDER By Family;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  end;
  end;

Procedure ReBaseKolis;
  begin
  With FKoliz do begin
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select N1.Family, N1.Name, N1.SName, N1.Date_Rozhd, N1.Nom_Polis');
  ADOQ.SQL.Add('From TPerson N1, TPerson N2');
  ADOQ.SQL.Add('Where N1.Family = N2.Family');
  ADOQ.SQL.Add(  'and N1.Name = N2.Name');
  ADOQ.SQL.Add(  'and N1.SName = N2.SName');
  ADOQ.SQL.Add(  'and (N1.Nom_Polis <> N2.Nom_Polis');
  ADOQ.SQL.Add(  'or N1.Date_Rozhd <> N2.Date_Rozhd)');
  ADOQ.SQL.Add(  'or N1.Nom_Polis = N2.Nom_Polis');
  ADOQ.SQL.Add(  'and (N1.Family <> N2.Family');
  ADOQ.SQL.Add(  'or N1.Name <> N2.Name');
  ADOQ.SQL.Add(  'or N1.SName <> N2.SName');
  ADOQ.SQL.Add(  'or N1.Date_Rozhd <> N2.Date_Rozhd)');
  ADOQ.SQL.Add( 'ORDER By N1.Family;');
  ADOQ.ExecSQL;
  ADOQ.Open;
  ADOQ.RecNo:=1;
//  ReBaseKolisNom;
  end;
  end;

procedure TFKoliz.FormActivate(Sender: TObject);
begin
ReBaseKolis;
end;

procedure TFKoliz.DbKolisCellClick(Column: TColumn);
begin
ReBaseKolisNom;
end;

procedure TFKoliz.BtYstrKolisClick(Sender: TObject);
var
  nom,i:word;
  NomPerson:String;
begin
  Nom:=ADOQ1.RecNo;
  NomPerson:=ADOQ1.Fields[0].AsString;
  For i:=1 to ADOQ1.RecordCount do
    If I<>nom then
    begin
    ADOQ1.RecNo:=i;
    ADOSave.SQL.Clear;
    ADOSave.SQL.Add('Update TKyrs');
    ADOSave.SQL.Add('Set Id_Person_Kyrs = '+NomPerson);
    ADOSave.SQL.Add('Where Id_Person_Kyrs= '+ADOQ1.Fields[0].AsString);
    ADOSave.ExecSQL;
    DBGrid1.DataSource.DataSet.Delete;
    end;
  ReBaseKolis;
end;

end.
