unit UAddK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, Spin, Grids, DBGrids, ExtCtrls, DB,
  ADODB;

type
  TFAddK = class(TForm)
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    DtStart: TDateTimePicker;
    DtEnd: TDateTimePicker;
    CbKonsult: TCheckBox;
    CbEnd: TCheckBox;
    BtAddK: TButton;
    BtQuitAddK: TButton;
    Label8: TLabel;
    SeKolSeans: TSpinEdit;
    CBDiagnoz: TComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    DBAddK: TDBGrid;
    BtSaveTabled: TButton;
    BtDelAddP: TButton;
    CbShifrDiagnoz: TComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    ADOQ: TADOQuery;
    ADOQ1: TADOQuery;
    MeDiagnoz: TMemo;
    Label2: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    MeAnam: TMemo;
    MeEpic: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    btDiagnoz: TButton;
    BtShal: TButton;
    CbShal: TComboBox;
    Label9: TLabel;
    procedure CbEndClick(Sender: TObject);
    procedure BtAddKClick(Sender: TObject);
    procedure BtQuitAddKClick(Sender: TObject);
    procedure CbShifrDiagnozChange(Sender: TObject);
    procedure CBDiagnozChange(Sender: TObject);
    procedure BtSaveTabledClick(Sender: TObject);
    procedure BtDelAddPClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btDiagnozClick(Sender: TObject);
    procedure BtShalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddK: TFAddK;

implementation

{$R *.dfm}
uses UMainForm;

Procedure ReBaseAddK;
  begin
  With FAddK do begin
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select Distinct AId_Person, AShifr_Diagnoz, ADiagnoz, ADateStart_Kyrs, ADateEnd_Kyrs,AShal, AEpic, AKol_Seans, AKonsult');
  ADOQ.SQL.Add('From TAdd');
  ADOQ.ExecSQL;
  ADOQ.Open;
  end;
  end;

procedure TFAddK.CbEndClick(Sender: TObject);
begin
Label6.Visible:=cbEnd.Checked and not CbKonsult.Checked;
DtEnd.Visible:=cbEnd.Checked and not CbKonsult.Checked;
end;

procedure TFAddK.BtAddKClick(Sender: TObject);
var
st,st1,st2:string;
i:word;
begin
st1:='';
For i:=1 to MeAnam.Lines.Count do
  st1:=st1+MeAnam.Lines.Strings[i-1]+' ';
st2:='';
For i:=1 to MeEpic.Lines.Count do
  st2:=st2+MeEpic.Lines.Strings[i-1]+' ';
If MeDiagnoz.Lines.Count<>0 then
For i:=1 to MeDiagnoz.Lines.Count do
  begin
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('INSERT INTO TAdd (AId_Person, AShifr_Diagnoz, ADiagnoz, ADateStart_Kyrs, ADateEnd_Kyrs,AShal, AEpic, AKol_Seans, AKonsult)');
  If CbEnd.Checked then
  st:='VALUES ('+FMain.DB.DataSource.DataSet.Fields[0].AsString+
            ', '+Chr(39)+Copy(MeDiagnoz.Lines.Strings[i-1],1,Pos(';',MeDiagnoz.Lines.Strings[i-1])-1)+Chr(39)+
            ', '+Chr(39)+Copy(MeDiagnoz.Lines.Strings[i-1],Pos(';',MeDiagnoz.Lines.Strings[i-1])+2, Length(MeDiagnoz.Lines.Strings[i-1])-Pos(';',MeDiagnoz.Lines.Strings[i-1])+2)+Chr(39)+
            ', '+Chr(39)+DateToStr(DtStart.Date)+Chr(39)+
            ', '+Chr(39)+DateToStr(DtEnd.Date)+Chr(39)+
            ', '+Chr(39)+st1+Chr(39)+
            ', '+Chr(39)+st2+Chr(39)+
            ', '+IntToStr(SeKolSeans.Value)
  else
  st:='VALUES ('+FMain.DB.DataSource.DataSet.Fields[0].AsString+
            ', '+Chr(39)+Copy(MeDiagnoz.Lines.Strings[i-1],1,Pos(';',MeDiagnoz.Lines.Strings[i-1])-1)+Chr(39)+
            ', '+Chr(39)+Copy(MeDiagnoz.Lines.Strings[i-1],Pos(';',MeDiagnoz.Lines.Strings[i-1])+2, Length(MeDiagnoz.Lines.Strings[i-1])-Pos(';',MeDiagnoz.Lines.Strings[i-1])+2)+Chr(39)+
            ', '+Chr(39)+DateToStr(DtStart.Date)+Chr(39)+
            ', '+Chr(39)+Chr(39)+
            ', '+Chr(39)+st1+Chr(39)+
            ', '+Chr(39)+st2+Chr(39)+
            ', 0';
  If CbKonsult.Checked then
    St:=St+', True);'
  else
    St:=St+', False);';
  ADOQ.SQL.Add(st);
  ADOQ.ExecSQL;
  end
else
  ShowMessage('Не введено ни одного диагноза в курсе');
ReBaseAddK;
end;

procedure TFAddK.BtQuitAddKClick(Sender: TObject);
var
i:word;
begin
FAddK.Visible:=false;
FAddK.Enabled:=false;
for i:=DBAddK.DataSource.DataSet.RecordCount DownTo 1 do
    begin
    DBAddK.DataSource.DataSet.RecNo:=i;
    DBAddK.DataSource.DataSet.Delete;
    end;
end;

procedure TFAddK.CbShifrDiagnozChange(Sender: TObject);
begin
If CbShifrDiagnoz.ItemIndex<>-1 then
  begin
  CBDiagnoz.ItemIndex:=CbShifrDiagnoz.ItemIndex;
  end
end;

procedure TFAddK.CBDiagnozChange(Sender: TObject);
begin
If CBDiagnoz.ItemIndex<>-1 then
  begin
  CbShifrDiagnoz.ItemIndex:=CBDiagnoz.ItemIndex;
  end
end;

procedure TFAddK.BtSaveTabledClick(Sender: TObject);
var
  i:word;
begin
AddTabled;
ReBase;
ShowMessage('Данные успешно добавлены');
for i:=DBAddK.DataSource.DataSet.RecordCount downto 1 do
    begin
    DBAddK.DataSource.DataSet.RecNo:=i;
    DBAddK.DataSource.DataSet.Delete;
    end;
end;

procedure TFAddK.BtDelAddPClick(Sender: TObject);
begin
DBAddK.DataSource.DataSet.Delete;
end;

procedure TFAddK.FormActivate(Sender: TObject);
var
  i:word;
begin
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select * from TDiagnoz;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  CBDiagnoz.Items.Clear;
  CbShifrDiagnoz.Items.Clear;
  If ADOQ1.RecordCount<>0 then
  for i:=1 to ADOQ1.RecordCount do
    begin
    ADOQ1.RecNo:=i;
    CBDiagnoz.Items.Add(AdoQ1.Fields[1].AsString);
    CbShifrDiagnoz.Items.Add(AdoQ1.Fields[2].AsString);
    end
  else
    ShowMessage('Не найденно ни одного диагноза');
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select Sh from TShal;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  CbShal.Items.Clear;
  IF ADOQ1.RecordCount<>0 then
  for i:=1 to ADOQ1.RecordCount do
    begin
    ADOQ1.RecNo:=i;
    CbShal.Items.Add(AdoQ1.Fields[0].AsString);
    end
  else
    ShowMessage('Не найдена ни одна жалоба');
DtStart.Date:=date;
DtEnd.Date:=date;
ReBaseAddK;
MeEpic.Clear;
MeEpic.Lines.Add(StandartEpic);
end;

procedure TFAddK.btDiagnozClick(Sender: TObject);
begin
MeDiagnoz.Lines.Add(CbShifrDiagnoz.Text+'; '+CBDiagnoz.Text);
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Insert Into TDagnoz (Diagnoz,Shifr_Diagnoz)');
  ADOQ1.SQL.Add('values('+Chr(39)+CBDiagnoz.Text+Chr(39)+', '+Chr(39)+CbShifrDiagnoz.Text+Chr(39)+')');
  ADOQ1.ExecSQL;
end;

procedure TFAddK.BtShalClick(Sender: TObject);
begin
MeAnam.Lines.Add(CbShal.Text);
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Insert Into TShal (Sh)');
  ADOQ1.SQL.Add('values('+Chr(39)+CbShal.Text+Chr(39)+')');
  ADOQ1.ExecSQL;
end;

end.
