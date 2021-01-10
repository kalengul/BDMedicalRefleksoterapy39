unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, CheckLst,
  Mask, Spin,UAddP, UAddK, UVivodDate, USaveOt, ULoadOt, UKoliz, UChangePolis, UChangeDiagnoz, UOtkat;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Db: TDBGrid;
    DbKyrs: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ADOC1: TADOConnection;
    ADOQ: TADOQuery;
    ADOQKyrs: TADOQuery;
    RgSort: TRadioGroup;
    Panel5: TPanel;
    Label11: TLabel;
    Label6: TLabel;
    CbVisible: TCheckListBox;
    GroupBox1: TGroupBox;
    LaDlit: TLabel;
    EPolis: TEdit;
    EFamily: TEdit;
    EStreet: TEdit;
    ESex: TComboBox;
    EKolKyrs: TSpinEdit;
    ENomPerson: TSpinEdit;
    Label5: TLabel;
    Panel6: TPanel;
    CbPeopleNezKurs: TCheckBox;
    Label8: TLabel;
    BtAdd: TButton;
    BtAddKyrs: TButton;
    BtSeans: TButton;
    ADOSave: TADOQuery;
    Panel8: TPanel;
    Label13: TLabel;
    Panel9: TPanel;
    Label15: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    BtKyrsEnd: TButton;
    BtSaveOt: TButton;
    Panel12: TPanel;
    BtLoad: TButton;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    MDiagnoz: TMemo;
    MMetod: TMemo;
    MeAnamnez: TMemo;
    MeEpicriz: TMemo;
    BtAddKarta: TButton;
    ADODS: TADOQuery;
    ADOS1: TADOQuery;
    BtKolis: TButton;
    BtChangePolis: TButton;
    BtIsprDiagnoz: TButton;
    BtAddSexBase: TButton;
    BtChangeNAme: TButton;
    BtChangeSNAme: TButton;
    BtOtkat: TButton;
    Panel16: TPanel;
    Panel17: TPanel;
    DBArhiv: TDBGrid;
    ADOQKyrsA: TADOQuery;
    DataSource3: TDataSource;
    BtAddKartaArhive: TButton;
    BtDateStartKart: TButton;
    Panel7: TPanel;
    Panel18: TPanel;
    CbDateStartKyrs: TComboBox;
    BtDateStartKartArhiv: TButton;
    CbDateStartKyrsArhiv: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure RgSortClick(Sender: TObject);
    procedure CbVisibleClickCheck(Sender: TObject);
    procedure ENomPersonChange(Sender: TObject);
    procedure DbCellClick(Column: TColumn);
    procedure BtSeansClick(Sender: TObject);
    procedure BtAddClick(Sender: TObject);
    procedure BtAddKyrsClick(Sender: TObject);
    procedure DbKyrsCellClick(Column: TColumn);
    procedure EKyrsNatChange(Sender: TObject);
    procedure BtKyrsEndClick(Sender: TObject);
    procedure BtSaveOtClick(Sender: TObject);
    procedure ESexChange(Sender: TObject);
    procedure BtAddKartaClick(Sender: TObject);
    procedure BtLoadClick(Sender: TObject);
    procedure BtKolisClick(Sender: TObject);
    procedure BtChangePolisClick(Sender: TObject);
    procedure BtIsprDiagnozClick(Sender: TObject);
    procedure BtAddSexBaseClick(Sender: TObject);
    procedure BtChangeNAmeClick(Sender: TObject);
    procedure BtChangeSNAmeClick(Sender: TObject);
    procedure BtOtkatClick(Sender: TObject);
    procedure BtAddKartaArhiveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type
  TSortDate = array [0..3] of string;

var
  FMain: TFMain;
  Str,DopSt,DopStKyrs:String;
  StandartEpic:String;
  SortDate:Array of TSortDate; {TSortDate = array [0..3] of string;}

function dbstring:string;
procedure ReBase;
procedure ReBaseKyrs;
Procedure AddTabled;

implementation

uses USeans;
{$R *.dfm}

Procedure SortirovkaDate;
  var
  i,j:LongWord;
  Sd:Array of TSortDate;
  begin
  i:=0;
  While (i<=Length(SortDate)-2)
    and (SortDate[i][0][5]=SortDate[i+1][0][5]) do
    Inc(i);
  SetLength(Sd,i+1);
  For j:=0 to i do
    Sd[j]:=SortDate[j];
  For j:=i+1 to Length(SortDate)-1 do
    SortDate[j-i-1]:=SortDate[j];
  For j:=0 to i do
    SortDate[Length(SortDate)-i+j-1]:=Sd[j];
  end;

Procedure VivodAllDateStartKyrs(typeArhive:byte);
  var
  i,j,NomMinDate:word;
  ArrDate:array of string;
  Year,Month,Day:string;
  begin
  With FMain do begin
  ADOSave.Close;
  ADOSave.SQL.Clear;
  if typeArhive=0 then
    begin
    ADOSave.SQL.Add('Select Distinct DateStart_Kyrs');
    ADOSave.SQL.Add('from TKyrs');
    end
  else
    begin
    ADOSave.SQL.Add('Select Distinct DateStart_Kyrs_A');
    ADOSave.SQL.Add('from TKyrs_Arhiv');
    end;
  ADOSave.ExecSQL;
  ADOSave.Open;
  MMetod.Clear;
  //Загрузка данных
  SetLength(ArrDate,ADOSave.RecordCount);
  for i:=1 to ADOSave.RecordCount do
    begin
    ADOSave.RecNo:=i;
    ArrDate[i-1]:=ADOSave.Fields[0].AsString;
    Day:=Copy(ArrDate[i-1],1,2);
    Month:=Copy(ArrDate[i-1],4,2);
    Year:=Copy(ArrDate[i-1],7,4);
    ArrDate[i-1]:=Year+'.'+Month+'.'+Day;
    end;
  //Сортировка дат
  for i:=0 to Length(ArrDate)-2 do
    begin
    NomMinDate:=i;
    for j:=i+1 to Length(ArrDate)-1 do
      if ArrDate[NomMinDate]<ArrDate[j] then
        NomMinDate:=j;
    if NomMinDate<>i then
      begin
      Year:=ArrDate[NomMinDate];
      ArrDate[NomMinDate]:=ArrDate[i];
      ArrDate[i]:=year;
      end;
    end;
  //Вывод отсортированных дат
  for i:=0 to Length(ArrDate)-1 do
    begin
    Year:=Copy(ArrDate[i],1,4);
    Month:=Copy(ArrDate[i],6,2);
    Day:=Copy(ArrDate[i],9,2);
    ArrDate[i]:=Day+'.'+Month+'.'+Year;
    if typeArhive=0 then
      CbDateStartKyrs.Items.Add(ArrDate[i])
    else
      CbDateStartKyrsArhiv.Items.Add(ArrDate[i]);
    end;
  end;
  end;

Procedure VivodAllMethod;
  var
  i:word;
  begin
  With FMain do begin
  ADOSave.Close;
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Select Distinct Nom_Mt, Name_Mt');
  ADOSave.SQL.Add('from TMethod, TSeans, TSMethod');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add(' Id_Kyrs_Seans = '+DbKyrs.DataSource.DataSet.Fields[0].AsString);
  ADOSave.SQL.Add('and IdS_Mt = Id_Mt');
  ADOSave.SQL.Add('and IdS_Method = Id_Seans;');
  ADOSave.ExecSQL;
  ADOSave.Open;
  MMetod.Clear;
  for i:=1 to ADOSave.RecordCount do
    begin
    ADOSave.RecNo:=i;
    MMetod.Lines.Add(ADOSave.Fields[1].AsString+' -> '+ADOSave.Fields[0].AsString);
    end;
  end;
  end;

Procedure VivodAnamEpic;
  var
    st,st1:string;
  begin
  With FMain do begin
  ADOSave.Close;
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Select Distinct Shal, Epic');
  ADOSave.SQL.Add('from TKyrs');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add(' Id_Kyrs = '+DbKyrs.DataSource.DataSet.Fields[0].AsString+';');
  ADOSave.ExecSQL;
  ADOSave.Open;
  MeAnamnez.Clear;
  MeEpicriz.Clear;
  st:=ADOSave.Fields[0].AsString;
  st1:=ADOSave.Fields[1].AsString;
  MeAnamnez.Lines.Add(st);
  MeEpicriz.Lines.Add(st1);
  end;
  end;

Procedure VivodDiagnoz;
  var
  i:word;
  begin
  With FMain do begin
  ADOSave.Close;
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Select Distinct Diagnoz, Shifr_Diagnoz');
  ADOSave.SQL.Add('from TDiagnoz,TSDiagnoz');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add(' IdS_Diagnoz_Kyrs = '+DbKyrs.DataSource.DataSet.Fields[0].AsString);
  ADOSave.SQL.Add('and IdS_Diagnoz = Id_Diagnoz;');
  ADOSave.ExecSQL;
  ADOSave.Open;
  MDiagnoz.Clear;
  for i:=1 to ADOSave.RecordCount do
    begin
    ADOSave.RecNo:=i;
    MDiagnoz.Lines.Add(ADOSave.Fields[1].AsString+' -> '+ADOSave.Fields[0].AsString);
    end;
  end;
  VivodAllMethod;
  VivodAnamEpic;
  end;

procedure ReBase;
var
  st:string;
  begin
  With FMain do begin
  st:='Select Distinct Id_Person';
  If CbVisible.Checked[0] then St:=st+', Nom_Person';
  If CbVisible.Checked[1] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Family';
    end;
  If CbVisible.Checked[2] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Name';
    end;
  If CbVisible.Checked[3] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'SName';
    end;
  If CbVisible.Checked[4] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Sex';
    end;
  If CbVisible.Checked[5] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Date_Rozhd';
    end;
  If CbVisible.Checked[6] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Nom_Polis';
    end;
  If CbVisible.Checked[7] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Name_Street';
    end;
  If CbVisible.Checked[8] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Address';
    end;
  If CbVisible.Checked[9] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Date_Nat';
    end;
  If CbVisible.Checked[10] then
    begin
    if st<>'Select Distinct Id_Person' then  St:=St+', ';
    St:=st+'Kol_Kyrs';
    end;
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select * from TPerson;');
  ADOQ.ExecSQL;
  ADOQ.Open;
  If ADOQ.RecordCount<>0 then
  begin
  AdoQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add(st);
  ADOQ.SQL.Add('from TPerson, TStreet');
  ADOQ.SQL.Add('Where Id_Street=Id_Street_Person');
  If CbPeopleNezKurs.Checked then
    ADOQ.SQL.Add('and Id_Person=any (Select Id_Person_Kyrs from TKyrs where DateEnd='')');
  If EFamily.Text<>'' then
    ADOQ.SQL.Add('and Family Like '+Chr(39)+EFamily.Text+'%'+Chr(39));
  If ESex.Text<>'' then
    ADOQ.SQL.Add('and Sex = '+Chr(39)+ESex.Text+Chr(39));
  If EPolis.Text<>'' then
    ADOQ.SQL.Add('and Nom_Polis Like '+Chr(39)+EPolis.Text+'%'+Chr(39));
  If EStreet.Text<>'' then
    ADOQ.SQL.Add('and Name_Street Like '+Chr(39)+EStreet.Text+'%'+Chr(39));
  If EKolKyrs.Value<>-1 then
    ADOQ.SQL.Add('and Kol_Kyrs <= '+IntToStr(EKolKyrs.Value));
  If ENomPerson.Value<>-1 then
    ADOQ.SQL.Add('and Nom_Person = '+IntToStr(ENomPerson.Value));
  if DopSt='' then
    DopSt:='ORDER BY Id_Person DESC';
  ADOQ.SQL.Add(DopSt+';');
  ADOQ.ExecSQL;
  ADOQ.Open;
  end
  else
    ShowMessage('Не найдено ни одного пациента');
  end;
end;

Procedure AddTabled;
  var
  i:word;
  K:word;
  begin
  With FMain do begin
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TStreet (Name_Street)');
  ADOSave.SQL.Add('Select Distinct AName_Street');
  ADOSave.SQL.Add('From TAdd');
  ADOSave.SQL.Add('Where AName_Street<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and not AName_Street = Any(Select Name_Street From TStreet);');
  ADOSave.ExecSQL;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TDiagnoz (Diagnoz, Shifr_Diagnoz)');
  ADOSave.SQL.Add('Select Distinct ADiagnoz, AShifr_Diagnoz');
  ADOSave.SQL.Add('From TAdd');
  ADOSave.SQL.Add('Where ADiagnoz<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and AShifr_Diagnoz<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and not ADiagnoz = Any(Select Diagnoz From TDiagnoz)');
  ADOSave.SQL.Add('and not AShifr_Diagnoz = Any(Select Shifr_Diagnoz From TDiagnoz);');
  ADOSave.ExecSQL;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TPerson (Family, Name, Sname, Sex, Date_Rozhd, Nom_Polis, Address, Date_Nat, Kol_Kyrs, Nom_Person, Id_Street_Person)');
  ADOSave.SQL.Add('Select Distinct AFamily, AName, ASname, ASex, ADate_Rozhd, ANom_Polis, AAddress, ADate_Nat, AKol_Kyrs, ANom_Person, Id_Street');
  ADOSave.SQL.Add('From TAdd, TStreet');
  ADOSave.SQL.Add('Where AName_Street = Name_Street');
  ADOSave.SQL.Add('and Afamily<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and AName<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and ASName<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and ANom_Polis<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and ADate_Rozhd<>'+Chr(39)+ Chr(39));
  ADOSave.SQL.Add('and not Exists (Select * From TPerson');
  ADOSave.SQL.Add(                'Where AFamily = family');
  ADOSave.SQL.Add(                'and AName = Name');
  ADOSave.SQL.Add(                'and ASName = SName');
  ADOSave.SQL.Add(                'and ADate_Rozhd = Date_Rozhd');
  ADOSave.SQL.Add(                'And ANom_Polis = Nom_Polis);');
  ADOSave.ExecSQL;

  ADOS1.Close;
  ADOS1.SQL.Clear;
  ADOS1.SQL.Add('Select Distinct Afamily, AName, ASName, Adate_Rozhd, ANom_Polis, AAddress, KOD');
  ADOS1.SQL.Add('From TAdd ;');
  ADOS1.ExecSQL;
  ADOS1.Open;
  k:=ADOS1.RecordCount;
  For i:=1 to k do
    begin
    ADOS1.RecNo:=i;
    ADOSave.Close;
    ADOSave.SQL.Clear;
    ADOSave.SQL.Add('Select Id_Person');
    ADOSave.SQL.Add('From TPerson');
    ADOSave.SQL.Add('Where ');
    ADOSave.SQL.Add('Family = '+Chr(39)+ADOS1.Fields[0].AsString+Chr(39));
    ADOSave.SQL.Add('and Name = '+Chr(39)+ADOS1.Fields[1].AsString+Chr(39));
    ADOSave.SQL.Add('And SName = '+Chr(39)+ADOS1.Fields[2].AsString+Chr(39));
    ADOSave.SQL.Add('And date_Rozhd = '+Chr(39)+ADOS1.Fields[3].AsString+Chr(39));
    ADOSave.SQL.Add('And Nom_Polis = '+Chr(39)+ADOS1.Fields[4].AsString+Chr(39)+';');
    ADOSave.ExecSQL;
    ADOSave.Open;

    If ADOSAVE.RecordCount<>0 then
      begin
//      ShowMessage('Добавляемый пациент - '+ADOS1.Fields[0].AsString+' '+ADOS1.Fields[1].AsString+' '+ADOS1.Fields[2].AsString+' уже существует!');
      ADOSAVE.RecNo:=ADOSAVE.RecordCount;
      ADODS.SQL.Clear;
      ADODS.SQL.Add('Update TAdd ');
      ADODS.SQL.Add('Set AId_Person = '+AdoSave.Fields[0].asString);
      ADODS.SQL.Add('Where KOD = '+ADOS1.Fields[6].AsString+';');
      ADODS.ExecSQL;
      end;
    end;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TKyrs (DateStart_Kyrs, DateEnd_Kyrs, Kol_Seans, Konsult, Id_Person_Kyrs,Nom_Kyrs,Epic,Shal)');
  ADOSave.SQL.Add('Select Distinct ADateStart_Kyrs, ADateEnd_Kyrs, AKol_Seans, AKonsult, AId_Person, Kol_Kyrs,AEpic,AShal');
  ADOSave.SQL.Add('From TAdd,TPerson');
  ADOSave.SQL.Add('Where Id_Person=AId_Person');
  ADOSave.SQL.Add('and ADateStart_Kyrs<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and not Exists (Select * From TKyrs');
  ADOSave.SQL.Add(                'Where ADateStart_Kyrs = DateStart_Kyrs');
  ADOSave.SQL.Add(                'And AKonsult = Konsult');
  ADOSave.SQL.Add(                'and AId_Person = Id_Person_Kyrs);');
  ADOSave.ExecSQL;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Update TPerson');
  ADOSave.SQL.Add('Set Kol_Kyrs = Kol_Kyrs+1');
  ADOSave.SQL.Add('Where Id_Person= Any (select AId_Person from TAdd);');
  ADOSave.ExecSQL;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TSDiagnoz (IdS_Diagnoz, IdS_Diagnoz_Kyrs)');
  ADOSave.SQL.Add('Select Distinct Id_Diagnoz, Id_Kyrs');
  ADOSave.SQL.Add('From Tdiagnoz, TKyrs, TAdd');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add('not Exists (Select * From TSDiagnoz');
  ADOSave.SQL.Add(            'Where Id_Diagnoz = IdS_Diagnoz ');
  ADOSave.SQL.Add(            'and Id_Kyrs = IdS_Diagnoz_Kyrs)');
  ADOSave.SQL.Add('and ADateStart_Kyrs<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and (ADiagnoz = Diagnoz or AShifr_diagnoz=Shifr_Diagnoz)');
  ADOSave.SQL.Add('and ADateStart_Kyrs = DateStart_Kyrs');
  ADOSave.SQL.Add('And AKol_Seans = Kol_Seans');
  ADOSave.SQL.Add('And AKonsult = Konsult');
  ADOSave.SQL.Add('and AId_Person = Id_Person_Kyrs;');
  ADOSave.ExecSQL;

  ADOS1.Close;
  ADOS1.SQL.Clear;
  ADOS1.SQL.Add('Select AdateStart_Kyrs, AKonsult, AId_Person, KOD');
  ADOS1.SQL.Add('From TAdd ;');
  ADOS1.ExecSQL;
  ADOS1.Open;
  For i:=1 to ADOS1.RecordCount do
    begin
    ADOS1.RecNo:=i;
    ADOSave.Close;
    ADOSave.SQL.Clear;
    ADOSave.SQL.Add('Select Id_Kyrs');
    ADOSave.SQL.Add('From TKyrs');
    ADOSave.SQL.Add('Where ');
    ADOSave.SQL.Add('dateStart_Kyrs = '+Chr(39)+ADOS1.Fields[0].AsString+Chr(39));
    ADOSave.SQL.Add('and Konsult = '+ADOS1.Fields[1].AsString);
    ADOSave.SQL.Add('and Id_Person_Kyrs = '+ADOS1.Fields[2].AsString+';');
    ADOSave.ExecSQL;
    ADOSave.Open;
    If ADOSAVE.RecordCount<>0 then
      begin
      ADOSAVE.RecNo:=ADOSAVE.RecordCount;
      ADODS.SQL.Clear;
      ADODS.SQL.Add('Update TAdd ');
      ADODS.SQL.Add('Set AId_Kyrs = '+AdoSave.Fields[0].asString);
      ADODS.SQL.Add('Where KOD = '+ADOS1.Fields[3].AsString+';');
      ADODS.ExecSQL;
      end;
    end;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TSeans (date_Seans, dinamika, Id_Kyrs_Seans, Sposob)');
  ADOSave.SQL.Add('Select Distinct Adate_Seans, Adinamika, AId_Kyrs, ASposob');
  ADOSave.SQL.Add('From TAdd');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add('Adate_Seans<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and AId_Kyrs<>0');
  ADOSave.SQL.Add('and not Exists (Select * From TSeans');
  ADOSave.SQL.Add(            'Where Adate_Seans = date_Seans');
  ADOSave.SQL.Add(            'and AId_Kyrs = Id_Kyrs_Seans);');
  ADOSave.ExecSQL;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TSMethod (IdS_Method, IdS_Mt)');
  ADOSave.SQL.Add('Select Distinct Id_Seans, Id_Mt');
  ADOSave.SQL.Add('From TMethod, TSeans, TAdd');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add('(AName_Mt = Name_Mt or ANom_Mt=Nom_Mt)');
  ADOSave.SQL.Add('And Adate_Seans = date_Seans');
  ADOSave.SQL.Add('And AId_Kyrs = Id_Kyrs_Seans;');
  ADOSave.ExecSQL;

  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TSTochki (Id_Point_Tochki, Id_seans_Tochki)');
  ADOSave.SQL.Add('Select Distinct Id_Point, Id_Seans');
  ADOSave.SQL.Add('From TPoint, TSeans, TAdd');
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add('(ALocal = Local_Point And AName_Point=Name_Point)');
  ADOSave.SQL.Add('And Adate_Seans = date_Seans');
  ADOSave.SQL.Add('And Adinamika = dinamika');
  ADOSave.SQL.Add('And AId_Kyrs = Id_Kyrs_Seans;');
  ADOSave.ExecSQL;
  End;
  end;

procedure ReBaseKyrs;
  begin
  With FMain do begin
  MDiagnoz.Clear;
  MMetod.Clear;
  MeAnamnez.Clear;
  MeEpicriz.Clear;
  AdoQKyrs.Close;
  ADOQKyrs.SQL.Clear;
  IF DB.DataSource.DataSet.RecordCount<>0 then
  begin
  AdoQKyrsA.Close;
  ADOQKyrsA.SQL.Clear;
  ADOQKyrsA.SQL.Add('Select Id_Kyrs_A ,Konsult_A, DateStart_Kyrs_A, DateEnd_Kyrs_A, Kol_seans_A, Nom_Kyrs_A');
  ADOQKyrsA.SQL.Add('from TKyrs_Arhiv');
  ADOQKyrsA.SQL.Add('Where ');
  ADOQKyrsA.SQL.Add(' Id_Person_Kyrs_A = '+DB.DataSource.DataSet.Fields[0].AsString);
  ADOQKyrsA.SQL.Add('ORDER BY Id_Kyrs_A DESC;');
  ADOQKyrsA.ExecSQL;
  ADOQKyrsA.Open;
  ADOQKyrs.SQL.Add('Select Distinct Id_Kyrs ,Konsult, DateStart_Kyrs, DateEnd_Kyrs, Kol_seans, Nom_Kyrs');
  ADOQKyrs.SQL.Add('from TKyrs');
  ADOQKyrs.SQL.Add('Where ');
  ADOQKyrs.SQL.Add(' Id_Person_Kyrs = '+DB.DataSource.DataSet.Fields[0].AsString);
  ADOQKyrs.SQL.Add(DopStKyrs+';');
  end;
  ADOQKyrs.ExecSQL;
  ADOQKyrs.Open;
  if ADOQKyrs.RecordCount>0 then
    begin
    ADOQKyrs.RecNo:=1;
    vivodDiagnoz;
    end;
  end;
end;

function CheckIfAccessDB(lDBPathName: string): Boolean;
var
UnTypedFile: file of byte;
Buffer: array[0..19] of byte;
NumRecsRead: Integer;
i: Integer;
MyString: string;
begin
AssignFile(UnTypedFile, lDBPathName);
reset(UnTypedFile);
BlockRead(UnTypedFile, Buffer, High(Buffer), NumRecsRead);
CloseFile(UnTypedFile);
for i := 1 to High(Buffer) do
MyString := MyString + Trim(Chr(Ord(Buffer[i])));
Result := False;
if Mystring = 'StandardJetDB' then
Result := True;
end;

Procedure ConnectionBase(NameBase:string);
begin
FMain.ADOC1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'+
'Data Source='+NameBase+';'+
'Mode=ReadWrite;'+
'Persist Security Info=False;';
FMain.ADOC1.Open;

end;

procedure TFMain.FormActivate(Sender: TObject);
var
i:byte;
f:TextFile;
st:string;
begin
For i:=0 to 10 do
 CbVisible.Checked[i]:=true;
if FileExists('db1.mdb') then
    if (Trim('db1.mdb') <> '') and (CheckIfAccessDB('db1.mdb')) then
      ConnectionBase('db1.mdb');
  ReBase;
  if DB.DataSource.DataSet.RecordCount>0 then
    begin
    DB.DataSource.DataSet.RecNo:=1;
    ReBaseKyrs;
    end;
AssignFile(f,'Эпикриз.txt');
Reset(f);
StandartEpic:='';
While not EOF(f) do
  begin
  Readln(f,st);
  StandartEpic:=StandartEpic+St+' ';
  end;
CloseFile(f);
VivodAllDateStartKyrs(0);
VivodAllDateStartKyrs(1);
end;

procedure TFMain.RgSortClick(Sender: TObject);
begin
DopSt:='ORDER BY ';
Case RgSort.ItemIndex of
    0:DopSt:=DopSt+'Family';
    1:DopSt:=DopSt+'Name';
    2:DopSt:=DopSt+'SName';
    3:DopSt:=DopSt+'Sex';
    4:DopSt:=DopSt+'Date_Rozhd';
    5:DopSt:=DopSt+'Nom_Polis';
    6:DopSt:=DopSt+'Name_Street';
    7:DopSt:=DopSt+'Address';
    8:DopSt:=DopSt+'Date_Nat';
    9:DopSt:=DopSt+'Kol_Kyrs';
    10:DopSt:=DopSt+'Nom_Person';
  else
    DopSt:='';
  end;
ReBase;
end;

procedure TFMain.CbVisibleClickCheck(Sender: TObject);
begin
ReBase;
ReBaseKyrs;
end;

function dbstring:string;
var
i:integer;
begin
result:='';
for i:=0 to FMain.DB.DataSource.DataSet.FieldCount-1 do
result:=result+FMain.DB.DataSource.DataSet.Fields[i].AsString+';';
end;

procedure TFMain.ENomPersonChange(Sender: TObject);
begin
ReBase;
end;

procedure TFMain.DbCellClick(Column: TColumn);
begin
ReBaseKyrs
end;

procedure TFMain.BtSeansClick(Sender: TObject);
begin
FSeans.Visible:=true;
FSeans.Enabled:=true;
end;

//Db.DataSource.DataSet.Delete;

procedure TFMain.BtAddClick(Sender: TObject);
begin
FAddP.Visible:=true;
FAddP.Enabled:=true;
end;

procedure TFMain.BtAddKyrsClick(Sender: TObject);
begin
FAddK.Visible:=true;
FAddK.Enabled:=true;
end;

procedure TFMain.DbKyrsCellClick(Column: TColumn);
begin
  vivodDiagnoz;
end;

procedure TFMain.EKyrsNatChange(Sender: TObject);
begin
ReBaseKyrs
end;

procedure TFMain.BtKyrsEndClick(Sender: TObject);
begin
FDate.Enabled:=true;
FDate.Visible:=true;
end;

procedure TFMain.BtSaveOtClick(Sender: TObject);
begin
FSaveOt.Enabled:=true;
FSaveOt.Visible:=true;
end;

procedure TFMain.ESexChange(Sender: TObject);
begin
ReBase;
end;

Procedure AddAllKartMes;
begin

end;

procedure ZapKartaPacient;
var
i,j:word;
st:string;
begin
With FMain do
begin
{}
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Select Distinct family, Name, SName, Date_Rozhd, Sex, Name_Street, Address, Nom_Polis');
ADOSave.SQL.Add('From TPerson,TStreet');
ADOSave.SQL.Add('Where Id_Street_Person=Id_Street');
ADOSave.SQL.Add('and Id_Person='+DB.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ADOSave.Open;
CheckExcelRun;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[8,3]:=AdoSave.Fields[0].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[9,1]:=AdoSave.Fields[1].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[9,4]:=AdoSave.Fields[2].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[10,2]:=AdoSave.Fields[3].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[10,5]:=AdoSave.Fields[4].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[11,2]:=AdoSave.Fields[5].AsString+' '+AdoSave.Fields[6].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[12,3]:=Chr(39)+AdoSave.Fields[7].AsString;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Select Distinct Diagnoz, Shal_A, Nom_Kyrs_A, Epic_A');
ADOSave.SQL.Add('From TKyrs_Arhiv,TSDiagnoz_Arhiv, TDiagnoz');
ADOSave.SQL.Add('Where Id_Kyrs_A=IdS_Diagnoz_Kyrs_A');
ADOSave.SQL.Add('and IdS_Diagnoz_A=Id_Diagnoz');
ADOSave.SQL.Add('and Id_Kyrs_A='+DBArhiv.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ADOSave.Open;
AdoSave.RecNo:=1;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[13,3]:=AdoSave.Fields[0].AsString;
st:='';
For i:=2 to ADOSave.RecordCount do
  begin
  AdoSave.RecNo:=i;
  st:=st+AdoSave.Fields[0].AsString+'; ';
  end;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[14,3]:=st;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[19,3]:=AdoSave.Fields[2].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[15,5]:=Copy(AdoSave.Fields[1].AsString,0,24);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[16,1]:=Copy(AdoSave.Fields[1].AsString,25,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[17,1]:=Copy(AdoSave.Fields[1].AsString,81,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[18,1]:=Copy(AdoSave.Fields[1].AsString,137,Length(AdoSave.Fields[1].AsString)-31);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[21,13]:=Copy(AdoSave.Fields[3].AsString,0,24);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[22,9]:=Copy(AdoSave.Fields[3].AsString,25,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[23,9]:=Copy(AdoSave.Fields[3].AsString,81,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[24,9]:=Copy(AdoSave.Fields[3].AsString,137,Length(AdoSave.Fields[1].AsString)-31);
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Select Distinct date_Seans_A, Dinamika_A, Sposob_A, Id_Seans_A');
ADOSave.SQL.Add('From TSeans_Arhiv');
ADOSave.SQL.Add('Where Id_Kyrs_Seans_A='+DBArhiv.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ADOSave.Open;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[20,3]:=AdoSave.RecordCount;
SetLength(SortDate,AdoSave.RecordCount);
For i:=1 to AdoSave.RecordCount do
  begin
  ADOSave.RecNo:=i;
  SortDate[i-1][0]:=AdoSave.Fields[0].AsString;
  SortDate[i-1][1]:=AdoSave.Fields[1].AsString;
  SortDate[i-1][2]:=AdoSave.Fields[2].AsString;
  SortDate[i-1][3]:=AdoSave.Fields[3].AsString;
  end;
SortirovkaDate;
For i:=1 to Length(SortDate) do
  begin
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,10]:=SortDate[i-1][0];
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,14]:=SortDate[i-1][1];
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,12]:=SortDate[i-1][2];
  ADODS.Close;
  ADODS.SQL.Clear;
  ADODS.SQL.Add('Select Distinct Name_Mt');
  ADODS.SQL.Add('From TSMethod_Arhiv, TMethod');
  ADODS.SQL.Add('Where IdS_mt_A=Id_Mt');
  ADODS.SQL.Add('and IdS_Method_A='+SortDate[i-1][3]+';');
  ADODS.ExecSQL;
  ADODS.Open;
  st:='';
  For j:=1 to ADODS.RecordCount do
    begin
    ADODS.RecNo:=j;
    st:=st+ADODS.Fields[0].AsString+'; ';
    end;
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,11]:=st;
  ADODS.Close;
  ADODS.SQL.Clear;
  ADODS.SQL.Add('Select Distinct Local_Point, Name_Point');
  ADODS.SQL.Add('From TSTochki_Arhiv, TPoint');
  ADODS.SQL.Add('Where Id_Point_Tochki_A=Id_Point');
  ADODS.SQL.Add('and Id_Seans_Tochki_A='+SortDate[i-1][3]+';');
  ADODS.ExecSQL;
  ADODS.Open;
  st:='';
  For j:=1 to ADODS.RecordCount do
    begin
    ADODS.RecNo:=j;
    st:=st+ADODS.Fields[1].AsString+'; ';
    end;
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,13]:=st;
  end;
end;
end;

procedure TFMain.BtAddKartaArhiveClick(Sender: TObject);
begin
ZapKartaPacient;
end;

procedure TFMain.BtAddKartaClick(Sender: TObject);
var
i,j:word;
st:string;
begin
{}
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Select Distinct family, Name, SName, Date_Rozhd, Sex, Name_Street, Address, Nom_Polis');
ADOSave.SQL.Add('From TPerson,TStreet');
ADOSave.SQL.Add('Where Id_Street_Person=Id_Street');
ADOSave.SQL.Add('and Id_Person='+DB.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ADOSave.Open;
CheckExcelRun;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[8,3]:=AdoSave.Fields[0].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[9,1]:=AdoSave.Fields[1].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[9,4]:=AdoSave.Fields[2].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[10,2]:=AdoSave.Fields[3].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[10,5]:=AdoSave.Fields[4].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[11,2]:=AdoSave.Fields[5].AsString+' '+AdoSave.Fields[6].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[12,3]:=Chr(39)+AdoSave.Fields[7].AsString;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Select Distinct Diagnoz, Shal, Nom_Kyrs, Epic');
ADOSave.SQL.Add('From TKyrs,TSDiagnoz, TDiagnoz');
ADOSave.SQL.Add('Where Id_Kyrs=IdS_Diagnoz_Kyrs');
ADOSave.SQL.Add('and IdS_Diagnoz=Id_Diagnoz');
ADOSave.SQL.Add('and Id_Kyrs='+DbKyrs.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ADOSave.Open;
AdoSave.RecNo:=1;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[13,3]:=AdoSave.Fields[0].AsString;
st:='';
For i:=2 to ADOSave.RecordCount do
  begin
  AdoSave.RecNo:=i;
  st:=st+AdoSave.Fields[0].AsString+'; ';
  end;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[14,3]:=st;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[19,3]:=AdoSave.Fields[2].AsString;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[15,5]:=Copy(AdoSave.Fields[1].AsString,0,24);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[16,1]:=Copy(AdoSave.Fields[1].AsString,25,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[17,1]:=Copy(AdoSave.Fields[1].AsString,81,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[18,1]:=Copy(AdoSave.Fields[1].AsString,137,Length(AdoSave.Fields[1].AsString)-31);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[21,13]:=Copy(AdoSave.Fields[3].AsString,0,24);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[22,9]:=Copy(AdoSave.Fields[3].AsString,25,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[23,9]:=Copy(AdoSave.Fields[3].AsString,81,55);
MyExcel.ActiveWorkBook.ActiveSheet.Cells[24,9]:=Copy(AdoSave.Fields[3].AsString,137,Length(AdoSave.Fields[1].AsString)-31);
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Select Distinct date_Seans, Dinamika, Sposob, Id_Seans');
ADOSave.SQL.Add('From TSeans');
ADOSave.SQL.Add('Where Id_Kyrs_Seans='+DbKyrs.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ADOSave.Open;
MyExcel.ActiveWorkBook.ActiveSheet.Cells[20,3]:=AdoSave.RecordCount;
SetLength(SortDate,AdoSave.RecordCount);
For i:=1 to AdoSave.RecordCount do
  begin
  ADOSave.RecNo:=i;
  SortDate[i-1][0]:=AdoSave.Fields[0].AsString;
  SortDate[i-1][1]:=AdoSave.Fields[1].AsString;
  SortDate[i-1][2]:=AdoSave.Fields[2].AsString;
  SortDate[i-1][3]:=AdoSave.Fields[3].AsString;
  end;
SortirovkaDate;
For i:=1 to Length(SortDate) do
  begin
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,10]:=SortDate[i-1][0];
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,14]:=SortDate[i-1][1];
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,12]:=SortDate[i-1][2];
  ADODS.Close;
  ADODS.SQL.Clear;
  ADODS.SQL.Add('Select Distinct Name_Mt');
  ADODS.SQL.Add('From TSMethod, TMethod');
  ADODS.SQL.Add('Where IdS_mt=Id_Mt');
  ADODS.SQL.Add('and IdS_Method='+SortDate[i-1][3]+';');
  ADODS.ExecSQL;
  ADODS.Open;
  st:='';
  For j:=1 to ADODS.RecordCount do
    begin
    ADODS.RecNo:=j;
    st:=st+ADODS.Fields[0].AsString+'; ';
    end;
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,11]:=st;
  ADODS.Close;
  ADODS.SQL.Clear;
  ADODS.SQL.Add('Select Distinct Local_Point, Name_Point');
  ADODS.SQL.Add('From TSTochki, TPoint');
  ADODS.SQL.Add('Where Id_Point_Tochki=Id_Point');
  ADODS.SQL.Add('and Id_Seans_Tochki='+SortDate[i-1][3]+';');
  ADODS.ExecSQL;
  ADODS.Open;
  st:='';
  For j:=1 to ADODS.RecordCount do
    begin
    ADODS.RecNo:=j;
    st:=st+ADODS.Fields[1].AsString+'; ';
    end;
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[4+i,13]:=st;
  end;
end;

procedure TFMain.BtLoadClick(Sender: TObject);
begin
FLoad.ShowModal;
{FLoad.Enabled;
FLoad.Visible;}
end;

procedure TFMain.BtKolisClick(Sender: TObject);
begin
FKoliz.ShowModal;
end;

procedure TFMain.BtChangePolisClick(Sender: TObject);
begin
FChangePolis.Label1.Caption:='Старый полис';
FChangePolis.Label2.Caption:='Новый полис';
FChangePolis.BtChange.Caption:='Изменить полис';
FChangePolis.EdOldPolis.Text:=DB.DataSource.DataSet.Fields[7].AsString;
FChangePolis.EdNewPolis.Text:=DB.DataSource.DataSet.Fields[7].AsString;
FChangePolis.ShowModal;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('INSERT INTO TChange (Id_Person_Change, Date_Change, OldNAme, OldSNAme, OldFamily, OLdPolis)');
ADOSave.SQL.Add('VALUES ('+Chr(39)+DB.DataSource.DataSet.Fields[0].AsString+Chr(39)+','+Chr(39)+DateToStr(Now)+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[3].AsString+Chr(39)+
                ','+Chr(39)+DB.DataSource.DataSet.Fields[4].AsString+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[2].AsString+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[7].AsString+Chr(39)+')');
ADOSave.ExecSQL;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Update TPerson');
ADOSave.SQL.Add('Set Nom_Polis = '+Chr(39)+FChangePolis.EdNewPolis.Text+Chr(39));
ADOSave.SQL.Add('Where ');
ADOSave.SQL.Add(' Id_Person = '+DB.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ReBase;
ShowMessage('Полис успешно изменен');
end;

procedure TFMain.BtIsprDiagnozClick(Sender: TObject);
begin
FChangeDiagnoz.ShowModal;
end;

procedure TFMain.BtAddSexBaseClick(Sender: TObject);
var
j:LongWord;
st,sex:string;
begin
ADODS.Close;
ADODS.SQL.Clear;
ADODS.SQL.Add('Select Distinct Id_Person, SName, Sex');
ADODS.SQL.Add('From TPerson');
ADODS.ExecSQL;
ADODS.Open;
For j:=1 to ADODS.RecordCount do
  begin
  ADODS.RecNo:=j;
  st:=AdoDS.Fields[1].AsString;
  While St[Length(st)]=' ' do
    Delete(st,Length(st),1);
  If (St[Length(st)]='ч') and (St[Length(st)-1]='и') then
    sex:='мужской'
  Else
    sex:='женский';
  ADOSave.Close;
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Update TPerson');
  ADOSave.SQL.Add('Set Sex = '+Chr(39)+sex+Chr(39));
  ADOSave.SQL.Add('Where ');
  ADOSave.SQL.Add(' Id_Person = '+AdoDS.Fields[0].AsString+';');
  ADOSave.ExecSQL;
  end;
ReBase;
ShowMessage('Пол в базе проставлен автоматически');
end;

procedure TFMain.BtChangeNAmeClick(Sender: TObject);
begin
FChangePolis.Label1.Caption:='Старое имя';
FChangePolis.Label2.Caption:='Новое имя';
FChangePolis.BtChange.Caption:='Изменить имя';
FChangePolis.EdOldPolis.Text:=DB.DataSource.DataSet.Fields[3].AsString;
FChangePolis.EdNewPolis.Text:=DB.DataSource.DataSet.Fields[3].AsString;
FChangePolis.ShowModal;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('INSERT INTO TChange (Id_Person_Change, Date_Change, OldNAme, OldSNAme, OldFamily, OLdPolis)');
ADOSave.SQL.Add('VALUES ('+Chr(39)+DB.DataSource.DataSet.Fields[0].AsString+Chr(39)+','+Chr(39)+DateToStr(Now)+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[3].AsString+Chr(39)+
                ','+Chr(39)+DB.DataSource.DataSet.Fields[4].AsString+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[2].AsString+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[7].AsString+Chr(39)+')');
ADOSave.ExecSQL;

ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Update TPerson');
ADOSave.SQL.Add('Set Name = '+Chr(39)+FChangePolis.EdNewPolis.Text+Chr(39));
ADOSave.SQL.Add('Where ');
ADOSave.SQL.Add(' Id_Person = '+DB.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ReBase;
ShowMessage('Имя успешно изменено');
end;

procedure TFMain.BtChangeSNAmeClick(Sender: TObject);
begin
FChangePolis.Label1.Caption:='Старая Фамилия';
FChangePolis.Label2.Caption:='Новая Фамилия';
FChangePolis.BtChange.Caption:='Изменить фамилию';
FChangePolis.EdOldPolis.Text:=DB.DataSource.DataSet.Fields[2].AsString;
FChangePolis.EdNewPolis.Text:=DB.DataSource.DataSet.Fields[2].AsString;
FChangePolis.ShowModal;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('INSERT INTO TChange (Id_Person_Change, Date_Change, OldNAme, OldSNAme, OldFamily, OLdPolis)');
ADOSave.SQL.Add('VALUES ('+Chr(39)+DB.DataSource.DataSet.Fields[0].AsString+Chr(39)+','+Chr(39)+DateToStr(Now)+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[3].AsString+Chr(39)+
                ','+Chr(39)+DB.DataSource.DataSet.Fields[4].AsString+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[2].AsString+Chr(39)+','+Chr(39)+DB.DataSource.DataSet.Fields[7].AsString+Chr(39)+')');
ADOSave.ExecSQL;
ADOSave.Close;
ADOSave.SQL.Clear;
ADOSave.SQL.Add('Update TPerson');
ADOSave.SQL.Add('Set Family = '+Chr(39)+FChangePolis.EdNewPolis.Text+Chr(39));
ADOSave.SQL.Add('Where ');
ADOSave.SQL.Add(' Id_Person = '+DB.DataSource.DataSet.Fields[0].AsString+';');
ADOSave.ExecSQL;
ReBase;
ShowMessage('Фамилия успешно изменена');
end;

procedure TFMain.BtOtkatClick(Sender: TObject);
begin
FOtkat.ShowModal;
ReBase;
end;

end.



