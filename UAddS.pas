unit UAddS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, UMainForm, uSeans,
  Spin, ComCtrls,UDateSeans;

type
  TFAddS = class(TForm)
    BtAddK: TButton;
    BtDelAddP: TButton;
    BtSaveTabled: TButton;
    BtQuitAddS: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DbAddS: TDBGrid;
    ADOQ: TADOQuery;
    DataSource1: TDataSource;
    ADOQ1: TADOQuery;
    Label7: TLabel;
    CBProc: TComboBox;
    Label1: TLabel;
    CbShifrProc: TComboBox;
    Label2: TLabel;
    CbDinamika: TComboBox;
    CbPoint: TComboBox;
    Label3: TLabel;
    CbPointLocal: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    SEKolPoint: TSpinEdit;
    ADOQ2: TADOQuery;
    Panel3: TPanel;
    Panel4: TPanel;
    SeKolSeans: TSpinEdit;
    Label8: TLabel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    BtGetDate: TButton;
    MeDate: TMemo;
    Panel6: TPanel;
    Panel7: TPanel;
    CbRND: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    MeNatProc: TMemo;
    MeKonProc: TMemo;
    Panel8: TPanel;
    CbRandomPolnt: TCheckBox;
    CbSposob: TComboBox;
    Label5: TLabel;
    MePoint: TMemo;
    Label11: TLabel;
    BtAddPoint: TButton;
    BtAddProc: TButton;
    CbEndSeans: TCheckBox;
    BtSaveSeans: TButton;
    BtLoadSeans: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure BtQuitAddSClick(Sender: TObject);
    procedure BtSaveTabledClick(Sender: TObject);
    procedure BtDelAddPClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBProcChange(Sender: TObject);
    procedure CbShifrProcChange(Sender: TObject);
    procedure CbRandomPolntClick(Sender: TObject);
    procedure CbPointLocalChange(Sender: TObject);
    procedure BtAddKClick(Sender: TObject);
    procedure BtAddProcClick(Sender: TObject);
    procedure BtAddPointClick(Sender: TObject);
    procedure BtGetDateClick(Sender: TObject);
    procedure BtLoadSeansClick(Sender: TObject);
    procedure BtSaveSeansClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddS: TFAddS;

implementation

{$R *.dfm}

Procedure ReBaseAddS;
  begin
  With FAddS do begin
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select Distinct AId_Kyrs, Adate_Seans, ADinamika, ALocal, AName_Point, AName_Mt, ANom_Mt, ASposob');
  ADOQ.SQL.Add('From TAdd');
  ADOQ.ExecSQL;
  ADOQ.Open;
  end;
  end;



procedure TFAddS.BtQuitAddSClick(Sender: TObject);
var
  i:word;
begin
FAddS.Visible:=false;
FAddS.Enabled:=false;
for i:=DBAddS.DataSource.DataSet.RecordCount DownTo 1 do
    begin
    DBAddS.DataSource.DataSet.RecNo:=i;
    DBAddS.DataSource.DataSet.Delete;
    end;
end;

procedure TFAddS.BtSaveTabledClick(Sender: TObject);
var
  i:word;
begin
AddTabled;
ReBaseSeans;
ShowMessage('Данные успешно добавлены');
for i:=DBAddS.DataSource.DataSet.RecordCount DownTo 1 do
    begin
    DBAddS.DataSource.DataSet.RecNo:=i;
    DBAddS.DataSource.DataSet.Delete;
    end;
end;

procedure TFAddS.BtDelAddPClick(Sender: TObject);
begin
DBAddS.DataSource.DataSet.Delete;
end;

procedure TFAddS.FormActivate(Sender: TObject);
var
i:Word;
begin
  CBProc.Items.Clear;
  CbShifrProc.Items.Clear;
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select * from TMethod;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  If ADOQ1.RecordCount<>0 then
  for i:=1 to ADOQ1.RecordCount do
    begin
    ADOQ1.RecNo:=i;
    CBProc.Items.Add(AdoQ1.Fields[1].AsString);
    CbShifrProc.Items.Add(AdoQ1.Fields[2].AsString);
    end
  else
    ShowMessage('Не найдено ни одной процедуры');
  CBPointLocal.Items.Clear;
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select Local_Point from TPoint Group By Local_Point;');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  If ADOQ1.RecordCount<>0 then
  for i:=1 to ADOQ1.RecordCount do
    begin
    ADOQ1.RecNo:=i;
    CBPointLocal.Items.Add(AdoQ1.Fields[0].AsString);
    end
  else
    ShowMessage('Не найдено ни одной локализации точек');
ReBaseAddS;
end;

procedure TFAddS.CBProcChange(Sender: TObject);
begin
If CBProc.ItemIndex<>-1 then
  begin
  CbShifrProc.ItemIndex:=CBProc.ItemIndex;
  end
end;


procedure TFAddS.CbShifrProcChange(Sender: TObject);
begin
If CbShifrProc.ItemIndex<>-1 then
  begin
  CBProc.ItemIndex:=CbShifrProc.ItemIndex;
  end
end;

procedure TFAddS.CbRandomPolntClick(Sender: TObject);
begin
Label6.Visible:=CbRandomPolnt.Checked;
SEKolPoint.Visible:=CbRandomPolnt.Checked;
Label4.Visible:=not CbRandomPolnt.Checked;
CbPointLocal.Visible:=not CbRandomPolnt.Checked;
CbPoint.Visible:= not CbRandomPolnt.Checked;
Label3.Visible:=not CbRandomPolnt.Checked;
end;

procedure TFAddS.CbPointLocalChange(Sender: TObject);
var
i:word;
begin
  CBPoint.Items.Clear;
  ADOQ1.Close;
  ADOQ1.SQL.Clear;
  ADOQ1.SQL.Add('Select Name_Point from TPoint');
  ADOQ1.SQL.Add('Where Local_Point = '+Chr(39)+CbPointLocal.Text+Chr(39)+';');
  ADOQ1.ExecSQL;
  ADOQ1.Open;
  If ADOQ1.RecordCount<>0 then
  for i:=1 to ADOQ1.RecordCount do
    begin
    ADOQ1.RecNo:=i;
    CBPoint.Items.Add(AdoQ1.Fields[0].AsString);
    end
  else
    ShowMessage('Не найдено ни одной точки данной зоны');
end;

Procedure AddSeansTabled(DateSeans,Dinamika,NomMt,NameMt,Local,NamePoint,Sposob:string);
  begin
    FAddS.ADOQ.SQL.Clear;
    FAddS.ADOQ.SQL.Add('INSERT INTO TAdd (AId_Kyrs, ADate_Seans, ADinamika, AName_Mt, ANom_Mt, ALocal, AName_Point, ASposob)');
    FAddS.ADOQ.SQL.Add('Values ('+FMain.DbKyrs.DataSource.DataSet.Fields[0].AsString+', '+Chr(39)+DateSeans+Chr(39)+', '+Chr(39)+Dinamika+Chr(39)+', '+Chr(39)+NameMt+Chr(39)+
                       ', '+Chr(39)+NomMt+Chr(39)+', '+Chr(39)+Local+Chr(39)+', '+Chr(39)+NamePoint+Chr(39)+', '+Chr(39)+Sposob+Chr(39)+');');
    FAddS.ADOQ.ExecSQL;
  end;

procedure TFAddS.BtAddKClick(Sender: TObject);

var
i:word;

Procedure Add(Me:TMemo);
  var
  j,k,s,Rnd:word;
  begin
  If Me.Lines.Count<>0 then
  For j:=0 to Me.Lines.Count-1 do
    begin
    If (Me.Lines.Strings[j]='157001; КИРТ') or (Me.Lines.Strings[j]='157004; АТ') then
      begin
      If CbRandomPolnt.Checked then
      begin
      MePoint.Lines.Clear;
      For k:=1 to SEKolPoint.Value do
        For s:=0 to 3 do
          begin
          ADOQ1.Close;
          ADOQ1.SQL.Clear;
          ADOQ1.SQL.Add('Select Name_Point from TPoint');
          ADOQ1.SQL.Add('Where Local_Point = '+Chr(39)+CbPointLocal.Items.Strings[s]+Chr(39)+';');
          ADOQ1.ExecSQL;
          ADOQ1.Open;
          Rnd:=random(ADOQ1.RecordCount)+1;
          ADOQ1.RecNo:=Rnd;
          MePoint.Lines.Add(CbPointLocal.Items.Strings[s]+'; '+AdoQ1.Fields[0].AsString);
          end;
        end;
      For k:=0 to MePoint.Lines.Count-1 do
        AddSeansTabled(MeDate.Lines.Strings[i],
                       CbDinamika.Items.Strings[CbDinamika.ItemIndex],
                       Copy(Me.Lines.Strings[j],1,Pos(';',Me.Lines.Strings[j])-1),
                       Copy(Me.Lines.Strings[j],Pos(';',Me.Lines.Strings[j])+2, Length(Me.Lines.Strings[j])-Pos(';',Me.Lines.Strings[j])+2),
                       Copy(MePoint.Lines.Strings[k],1,Pos(';',MePoint.Lines.Strings[k])-1),
                       Copy(MePoint.Lines.Strings[k],Pos(';',MePoint.Lines.Strings[k])+2, Length(MePoint.Lines.Strings[k])-Pos(';',MePoint.Lines.Strings[k])+2),
                       CbSposob.Items.Strings[CbSposob.ItemIndex])
     end
     else
        AddSeansTabled(MeDate.Lines.Strings[i],
                       CbDinamika.Items.Strings[CbDinamika.ItemIndex],
                       Copy(Me.Lines.Strings[j],1,Pos(';',Me.Lines.Strings[j])-1),
                       Copy(Me.Lines.Strings[j],Pos(';',Me.Lines.Strings[j])+2, Length(Me.Lines.Strings[j])-Pos(';',Me.Lines.Strings[j])+2),
                       '',
                       '',
                       CbSposob.Items.Strings[CbSposob.ItemIndex])
    end
  else
    ShowMessage('Не введено ни одной процедуры сеанса');
  end;

begin
Randomize;
If MeDate.Lines.Count<>0 then
For i:=0 to MeDate.Lines.Count-1 do
  begin
  if CbRND.Checked then
    begin
    CbSposob.ItemIndex:=Random(3);
    CbDinamika.ItemIndex:=Random(2);
    end;
  If i<>MeDate.Lines.Count-1 then
    Add(MeNatProc)
  else
    Add(MeKonProc);
  end
else
  ShowMessage('Не введено ни одной дата сеанса');
ReBaseAddS;
end;

procedure TFAddS.BtAddProcClick(Sender: TObject);
begin
IF not CbEndSeans.Checked then
  MeNatProc.Lines.Add(CbShifrProc.Text+'; '+CBProc.Text);
MeKonProc.Lines.Add(CbShifrProc.Text+'; '+CBProc.Text)
end;

procedure TFAddS.BtAddPointClick(Sender: TObject);
begin
MePoint.Lines.Add(CbPointLocal.Text+'; '+CbPoint.Text);
end;

procedure TFAddS.BtGetDateClick(Sender: TObject);
begin
FAddDateSeans.ShowModal;
end;

procedure TFAddS.BtLoadSeansClick(Sender: TObject);
var
f:textfile;
i:Byte;
st:string;
Proc:byte;
begin
if OpenDialog.Execute and FileExists(OpenDialog.FileName) then
  begin
  AssignFile(f,OpenDialog.FileName);
  Reset(f);
  Readln(f,St);
  SeKolSeans.Value:=StrToInt(St);
  Readln(f,st);
  Proc:=0;
  While St<>'K' do
    begin
    If St='D' then begin Proc:=1; Readln(f,st); end;
    If St='Dk' then begin Proc:=2; Readln(f,st); end;
    IF (St<>'K') then
      Case proc Of
        0:MeDate.Lines.Add(St);
        1:MeNatProc.Lines.Add(St);
        2:MeKonProc.Lines.Add(St);
        end;
    Readln(f,st);
    end;
  CloseFile(f);
  end;
end;

procedure TFAddS.BtSaveSeansClick(Sender: TObject);
var
f:textfile;
i:Byte;
begin
if SaveDialog.Execute then
  begin
  AssignFile(f,SaveDialog.FileName);
  Rewrite(f);
  Writeln(f,SeKolSeans.Value);
  For i:=0 to MeDate.Lines.Count-1 do
    Writeln(f,MeDate.Lines.Strings[i]);
  Writeln(f,'D');
  For i:=0 to MeNatProc.Lines.Count-1 do
    Writeln(f,MeNatProc.Lines.Strings[i]);
  Writeln(f,'Dk');
  For i:=0 to MeKonProc.Lines.Count-1 do
    Writeln(f,MeKonProc.Lines.Strings[i]);
  Writeln(f,'K');
  CloseFile(f);
  end;
end;

end.

