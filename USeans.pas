unit USeans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, UMainForm, StdCtrls, ExtCtrls, Spin, Grids, DBGrids;

type
  TFSeans = class(TForm)
    ADOQSeans: TADOQuery;
    DataSource2: TDataSource;
    Panel2: TPanel;
    DbSeans: TDBGrid;
    Panel6: TPanel;
    BtAddKyrs: TButton;
    Panel1: TPanel;
    ADOQT: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    MPoint: TMemo;
    BtExit: TButton;
    MeProc: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure DbSeansCellClick(Column: TColumn);
    procedure BtExitClick(Sender: TObject);
    procedure BtAddKyrsClick(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSeans: TFSeans;

Procedure ReBaseSeans;
Procedure ReBasePoint;

implementation

uses uAdds;

{$R *.dfm}
Procedure ReBasePoint;
  var
  i:word;
  begin
  With FSeans do begin
  ADOQT.Close;
  ADOQT.SQL.Clear;
  ADOQT.SQL.Add('Select Distinct Name_Mt, Nom_Mt');
  ADOQT.SQL.Add('from TMethod,TSMethod,TSeans');
  ADOQT.SQL.Add('Where Id_Mt= IdS_Mt');
  ADOQT.SQL.Add('and IdS_Method= Id_Seans');
  ADOQT.SQL.Add('and Id_seans = '+DbSeans.DataSource.DataSet.Fields[0].AsString+';');
  ADOQT.ExecSQL;
  ADOQT.Open;
  MeProc.Clear;
  IF ADOQT.RecordCount<>0 then
  For i:=1 to  ADOQT.RecordCount do
    begin
    ADOQT.RecNo:=i;
    MeProc.Lines.Add(ADOQT.Fields[0].AsString+' -> '+ADOQT.Fields[1].AsString);
    end;
  ADOQT.Close;
  ADOQT.SQL.Clear;
  ADOQT.SQL.Add('Select Distinct Local_Point, Name_Point from TPoint,TSTochki');
  ADOQT.SQL.Add('Where Id_Point_Tochki = Id_Point');
  ADOQT.SQL.Add('and Id_Seans_Tochki = '+DbSeans.DataSource.DataSet.Fields[0].AsString+';');
  ADOQT.ExecSQL;
  ADOQT.Open;
  MPoint.Clear;
  If ADOQT.RecordCount<>0 then
  For i:=1 to  ADOQT.RecordCount do
    begin
    ADOQT.RecNo:=i;
    MPoint.Lines.Add(ADOQT.Fields[0].AsString+' -> '+ADOQT.Fields[1].AsString);
    end;
  end;
  end;

Procedure ReBaseSeans;
  begin
  With FSeans do begin
  ADOQSeans.Close;
  ADOQSeans.SQL.Clear;
  ADOQSeans.SQL.Add('Select Distinct Id_Seans, Date_Seans, Dinamika, Sposob');
  ADOQSeans.SQL.Add('from TSeans');
  ADOQSeans.SQL.Add('Where Id_Kyrs_Seans = '+FMain.DBKyrs.DataSource.DataSet.Fields[0].AsString+';');
  ADOQSeans.ExecSQL;
  ADOQSeans.Open;
  If ADOQSeans.RecordCount<>0 then
    begin
    ADOQSeans.RecNo:=1;
    ReBasePoint;
    end;
  end;
  end;

procedure TFSeans.FormActivate(Sender: TObject);
  begin
ReBaseSeans;
end;

procedure TFSeans.DbSeansCellClick(Column: TColumn);
begin
ReBasePoint;
end;

procedure TFSeans.BtExitClick(Sender: TObject);
begin
Fseans.Enabled:=false;
FSeans.Visible:=false;
ReBaseKyrs;
end;

procedure TFSeans.BtAddKyrsClick(Sender: TObject);
begin
FAddS.Enabled:=true;
FAddS.Visible:=true;
end;

end.
