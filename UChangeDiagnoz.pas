unit UChangeDiagnoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TFChangeDiagnoz = class(TForm)
    Panel1: TPanel;
    DbNAtDiagnoz: TDBGrid;
    DBDelDiagnoz: TDBGrid;
    ADOQ: TADOQuery;
    DataSource1: TDataSource;
    ADOQ1: TADOQuery;
    DataSource2: TDataSource;
    ADOSave: TADOQuery;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtGo: TButton;
    BtClose: TButton;
    procedure BtCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChangeDiagnoz: TFChangeDiagnoz;

implementation

{$R *.dfm}

procedure TFChangeDiagnoz.BtCloseClick(Sender: TObject);
begin
FChangeDiagnoz.Close;
end;

Procedure ReBaseDiagnoz(ADOQ: TADOQuery);
  begin
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select Id_Diagnoz, Diagnoz, Shifr_Diagnoz');
  ADOQ.SQL.Add('From TDiagnoz');
  ADOQ.SQL.Add('ORDER By Shifr_Diagnoz;');
  ADOQ.ExecSQL;
  ADOQ.Open;
  ADOQ.RecNo:=1;
  end;

procedure TFChangeDiagnoz.FormActivate(Sender: TObject);
begin
 ReBaseDiagnoz(ADOQ);
 ReBaseDiagnoz(ADOQ1);
end;

procedure TFChangeDiagnoz.BtGoClick(Sender: TObject);
begin
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Update TSDiagnoz');
ADOSave.SQL.Add('Set IdS_Diagnoz = '+DBNatDiagnoz.DataSource.DataSet.Fields[0].AsString);
ADOSave.SQL.Add('Where ');
ADOSave.SQL.Add(' IdS_Diagnoz = '+DbDelDiagnoz.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
DbDelDiagnoz.DataSource.DataSet.Delete;
ReBaseDiagnoz(ADOQ);
ReBaseDiagnoz(ADOQ1);
ShowMessage('Замена диагноза прошла успешно');
end;

end.
