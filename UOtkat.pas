unit UOtkat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB;

type
  TFOtkat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtOtk: TButton;
    DBGLeft: TDBGrid;
    DBGRight: TDBGrid;
    DataSource1: TDataSource;
    ADOQ1: TADOQuery;
    ADOOtkat: TADOQuery;
    ADOQ2: TADOQuery;
    DataSource2: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure DBGLeftCellClick(Column: TColumn);
    procedure BtOtkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOtkat: TFOtkat;

implementation

{$R *.dfm}

Procedure ReBaseOtkatHistory;
  begin
  With FOtkat do begin
  ADOQ2.Close;
  ADOQ2.SQL.Clear;
  ADOQ2.SQL.Add('Select *');
  ADOQ2.SQL.Add('From TChange');
  ADOQ2.SQL.Add('Where Id_Person_Change = '+ADOQ1.Fields[0].AsString);
//  ADOQ2.SQL.Add( 'ORDER By Date_Change;');
  ADOQ2.ExecSQL;
  ADOQ2.Open;
  end;
  end;

Procedure ReBaseOtkat;
  begin
  With FOtkat do begin
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select distinct Id_Person, Family, Name, SName, Nom_Polis');
  ADOQ1.SQL.Add('From TPerson,TChange');
  ADOQ1.SQL.Add('Where Id_Person = Id_Person_Change;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  ADOQ1.RecNo:=1;
  ReBAseOtkatHistory;
  end;
  end;


procedure TFOtkat.FormActivate(Sender: TObject);
begin
ReBaseOtkat;
end;

procedure TFOtkat.DBGLeftCellClick(Column: TColumn);
begin
ReBaseOtkatHistory;
end;

procedure TFOtkat.BtOtkClick(Sender: TObject);
begin
ADOOtkat.SQL.Clear;
ADOOtkat.SQL.Add('Update TPerson ');
ADOOtkat.SQL.Add('Set Family = '+Chr(39)+ADOQ2.Fields[5].AsString+Chr(39));
ADOOtkat.SQL.Add(',SName = '+Chr(39)+ADOQ2.Fields[4].AsString+Chr(39));
ADOOtkat.SQL.Add(',Name = '+Chr(39)+ADOQ2.Fields[3].AsString+Chr(39));
ADOOtkat.SQL.Add(',Nom_Polis = '+Chr(39)+ADOQ2.Fields[6].AsString+Chr(39));
ADOOtkat.SQL.Add('Where Id_Person= '+ADOQ1.Fields[0].AsString);
ADOOtkat.ExecSQL;
ReBaseOtkat;
end;

end.
