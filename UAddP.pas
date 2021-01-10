unit UAddP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Spin, DB, ADODB, DBCtrls, Grids,
  DBGrids;

type
  TFAddP = class(TForm)
    SeNomPerson: TSpinEdit;
    LeSName: TLabeledEdit;
    LePolis: TLabeledEdit;
    LeName: TLabeledEdit;
    Lefamily: TLabeledEdit;
    LeAdress: TLabeledEdit;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DTRoshd: TDateTimePicker;
    DtNat: TDateTimePicker;
    CbSex: TComboBox;
    BtAddP: TButton;
    BtQuitAddP: TButton;
    EStreet: TComboBox;
    ADOQ: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBAddP: TDBGrid;
    BtSaveTabled: TButton;
    BtDelAddP: TButton;
    ADOQ1: TADOQuery;
    procedure BtAddPClick(Sender: TObject);
    procedure BtQuitAddPClick(Sender: TObject);
    procedure BtSaveTabledClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtDelAddPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddP: TFAddP;

implementation

uses UMainForm;

{$R *.dfm}

Procedure ReBaseAddP;
  begin
  With FAddP do begin
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select AFamily, AName, ASName, ASex, ADate_Rozhd, ANom_Polis, AName_Street, AAddress, Adate_Nat, AKol_Kyrs, ANom_Person');
  ADOQ.SQL.Add('From TAdd');
  ADOQ.ExecSQL;
  ADOQ.Open;
  end;
  end;

procedure TFAddP.BtAddPClick(Sender: TObject);
var
st:string;
Bol:Boolean;
i:word;
begin
Bol:=true;
IF LEFamily.Text='' then
  begin
  Bol:=false;  ShowMessage('Фамилия не введена');
  end;
IF LEName.Text='' then
  begin
  Bol:=false;  ShowMessage('Имя не введено');
  end;
IF LESName.Text='' then
  begin
  Bol:=false;  ShowMessage('Отчество не введено');
  end;
IF LEPolis.Text='' then
  begin
  Bol:=false;  ShowMessage('Не введен номер полиса');
  end;
If Bol Then
  begin
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('INSERT INTO TAdd (AFamily, AName, ASName, ASex, ADate_Rozhd, ANom_Polis, AName_Street, AAddress, Adate_Nat, AKol_Kyrs, ANom_Person)');
  st:='VALUES ('+Chr(39)+LEFamily.Text+Chr(39)+', '+Chr(39)+LEName.text+Chr(39)+', '+Chr(39)+LESName.Text+Chr(39)+', '+Chr(39)+CbSex.Text+Chr(39)+
            ', '+Chr(39)+DateToStr(DTRoshd.Date)+Chr(39)+', '+Chr(39)+LEPolis.Text+Chr(39)+', '+Chr(39)+EStreet.Text+Chr(39)+
            ', '+Chr(39)+LEAdress.Text+Chr(39)+', '+Chr(39)+DateToStr(DtNat.Date)+Chr(39)+', 1, '+IntToStr(SENomPerson.Value)+');';
  ADOQ.SQL.Add(st);
  ADOQ.ExecSQL;
  end;
  ReBaseAddP;
end;

procedure TFAddP.BtQuitAddPClick(Sender: TObject);
var
i:word;
begin
FAddP.Visible:=false;
FAddP.Enabled:=false;
for i:=DBAddP.DataSource.DataSet.RecordCount DownTo 1 do
    begin
    DBAddP.DataSource.DataSet.RecNo:=i;
    DBAddP.DataSource.DataSet.Delete;
    end;
end;

procedure TFAddP.BtSaveTabledClick(Sender: TObject);
var
i:word;
begin
AddTabled;
ReBase;

ShowMessage('Данные успешно добавлены');

for i:=DBAddP.DataSource.DataSet.RecordCount DownTo 1 do
    begin
    DBAddP.DataSource.DataSet.RecNo:=i;
    DBAddP.DataSource.DataSet.Delete;
    end;

end;

procedure TFAddP.FormActivate(Sender: TObject);
var
  i:word;
begin
  EStreet.Items.Clear;
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select Name_Street from TStreet;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  If ADOQ1.RecordCount<>0 then
  for i:=1 to ADOQ1.RecordCount do
    begin
    ADOQ1.RecNo:=i;
    EStreet.Items.Add(AdoQ1.Fields[0].AsString);
    end
  Else
    ShowMessage('Не найдено ни одной улицы');
  DTRoshd.Date:=date;
  DtNat.Date:=Date;
  ReBaseAddP;
end;

procedure TFAddP.BtDelAddPClick(Sender: TObject);
begin
DBAddP.DataSource.DataSet.Delete;
end;

end.
