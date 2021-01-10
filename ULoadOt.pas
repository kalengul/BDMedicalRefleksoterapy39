unit ULoadOt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, USaveOt;

type
  TFLoad = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RgOt: TRadioGroup;
    BtLoadOt: TButton;
    btExitOt: TButton;
    ADOQ: TADOQuery;
    ADOSave: TADOQuery;
    LeLoad: TLabeledEdit;
    ADOQ1: TADOQuery;
    procedure BtLoadOtClick(Sender: TObject);
    procedure btExitOtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLoad: TFLoad;

implementation

uses UMainForm;

{$R *.dfm}

procedure TFLoad.BtLoadOtClick(Sender: TObject);
var
  i,j,k,z:word;
  ep:integer;
  nn:longint;
  DiagnozOb,ShifrDiagnoz1, Diagnoz1,SEnd:string;
  Street,Ad,Dt,StSql:string;
  Name,Name1,SName,Nom,kolkyrs,st,Polis,Polis1:string;
  DateStart,DateEnd,CDate,stdate,GodDate:string;
  NomMt,BaseNomMt,Dinamika,sposob:string;
  LPoint,NPoint:string;
  Osh:byte;
  BEnd:boolean;
  AddMt:Boolean;
  NomDiagnoz:Byte;
  NextYear:boolean;
begin
randomize;
CheckExcelRun;
i:=2;
SEnd:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[1,1];
While SEnd<>'' do
  begin
  DiagnozOb:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,4];
  DiagnozOb:=DiagnozOb+',';
  Street:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,6];
  k:=2;
  While (k<=Length(Street)) and ((Street[k]<'0') or (Street[k]>'9')) do
    inc(k);
  Ad:=Copy(Street,k,length(Street)-1);
  Street:=Copy(Street,1,k-2);
  Dt:=Copy(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,3],1,8);
    If Dt[7]='9' then
      Insert('19',Dt,7)
    else
      Insert('20',Dt,7);
  Case RgOt.ItemIndex of
      0: NomMt:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,8];
      1:begin NomMt:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,10]; end;
      2:begin NomMt:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,8];  end;
      end;
  If pos('-',NomMt)<>0 then
    begin
    Delete(NomMt,pos('-',NomMt),Length(NomMt));
    NomMt:=NomMt+', 157037, 157038,';
    end;
  While Pos(';',NomMt)<>0 do
    NomMt[Pos(';',NomMt)]:=',';
  While Pos(' ',NomMt)<>0 do
    Delete(NomMt,Pos(' ',NomMt),1);
  if (nomMt[Length(NomMt)]<>',') then
    nomMt:=NomMt+',';
  BaseNomMt:=NomMt;
  Name:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,2];
  Name1:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+1,2];
  SName:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,2];
  Osh:=0;
  If (Pos(' ',Name)<>0) and (Name[Pos(' ',Name)+1]>='А') then
    begin
    SName:=Name1;
    Name1:=Copy(Name,Pos(' ',Name)+1, Length(Name));
    Delete(Name,Pos(' ',Name), Length(Name));
    inc(Osh);
    end;
  If (Pos(' ',Name1)<>0) and (Name1[Pos(' ',Name1)+1]>='А') then
    begin
    SName:=Copy(Name1,Pos(' ',Name1)+1, Length(Name1));
    Delete(Name1,Pos(' ',Name1), Length(Name1));
    Inc(Osh);
    end;
  Case Random(2) of
    0:Dinamika:='Улучшение';
    1:Dinamika:='Без изменений';
    end;
  Case Random(3) of
    0:Sposob:='I/II BBM';
    1:Sposob:='I/II BTM';
    2:Sposob:='ГМ';
    end;
  Name:=name+' ';
  LeLoad.Text:=Name;
  Polis:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,5];
  IF Pos(' ',Polis)=0 then
    begin
    Polis1:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+1,5];
    Polis:=Polis+' '+Polis1;
    end;
  While ((Name[k]<'0') or (Name[k]>'9')) and (k<=Length(Name)) do
    inc(k);
  If k<=Length(Name) then
    begin
    Nom:=Copy(Name,k,1);
    Name:=Copy(Name,1,k-2);
    end
  else
    Nom:='-1';
  Case RgOt.ItemIndex of
    1:begin
      KolKyrs:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,7];
      Val(KolKyrs,z,ep);
      KolKyrs:=IntToStr(z);
      end;
    2:begin
      stDate:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,7];
      While Pos(';',stDate)<>0 do
        stDate[Pos(';',stDate)]:=',';
      GodDate:=Copy(StDate,7,2);
      If GodDate[1]='9' then
        GodDate:='19'+GodDate
      else
        GodDate:='20'+GodDate;
      DateStart:=Copy(StDate,1,6)+GodDate;
      NextYear:=(Copy(stDate,4,2)='12') and (Copy(StDate,Length(stDate)-4,2)='01');
      IF NextYear then
        DateEnd:=Copy(StDate,Length(stDate)-7,6)+IntToStr(StrToInt(GodDate)+1)
      else
        DateEnd:=Copy(StDate,Length(stDate)-7,6)+GodDate;
      CDate:=DateStart;
      Delete(StDate,1,10);
      end;
    end;
  k:=0;
  BEnd:=(Length(DiagnozOb)>0) or (NomMt<>'');
  NomDiagnoz:=1;
  While BEnd do
    begin
    j:=1;
    While (j<Length(DiagnozOb)) and ((DiagnozOb[j]<'0') or (DiagnozOb[j]>'9')) do
      inc(j);
    z:=j;
    While (z<Length(DiagnozOb)) and ((DiagnozOb[z]>='0') and (DiagnozOb[z]<='9') or (DiagnozOb[z]='.')) do
      inc(z);
    ShifrDiagnoz1:=Copy(DiagnozOb,j-1,z-j+1);
    Diagnoz1:=Copy(DiagnozOb,1,j-3);
    ADOQ.SQL.Clear;
    StSql:='INSERT INTO TAdd (AFamily, ANom_Person, AName, ASname, ADate_Rozhd, ADiagnoz, AShifr_Diagnoz, ANom_Polis, AName_Street, AAddress, AEpic, ';
    Case RgOt.ItemIndex of
      0:StSql:=StSql+'ADateStart_Kyrs, AKonsult)';
      1:StSql:=StSql+'AKol_Kyrs, ADateStart_Kyrs, ADateEnd_Kyrs, AKonsult, Adate_Seans, ANom_Mt)';
      2:StSql:=StSql+'ADateStart_Kyrs, ADateEnd_Kyrs, AKonsult, Adate_Seans, ANom_Mt, ADinamika, ASposob, ALocal, AName_Point)';
      end;
    ADOQ.SQL.Add(StSql);
    StSql:='VALUES ('+Chr(39)+Name+Chr(39)+', '
                         +Nom+', '
                         +Chr(39)+Name1+Chr(39)+', '
                         +Chr(39)+SName+Chr(39)+', '
                         +Chr(39)+Dt+Chr(39)+', '
                         +Chr(39)+Diagnoz1+Chr(39)+', '
                         +Chr(39)+ShifrDiagnoz1+Chr(39)+', '
                         +Chr(39)+Polis+Chr(39)+', '
                         +Chr(39)+Street+Chr(39)+', '
                         +Chr(39)+Ad+Chr(39)+', '
                         +Chr(39)+StandartEpic+Chr(39)+', ';
    Case RgOt.ItemIndex of
      0:StSql:=StSql+Chr(39)+Copy(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,7],1,length(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,7]))+Chr(39)+', '
                    +'True );';
      1:StSql:=StSql+kolKyrs+', '
                    +Chr(39)+Copy(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,8],1,length(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,8]))+Chr(39)+', '
                    +Chr(39)+Copy(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,9],1,length(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,9]))+Chr(39)+', '
                    +'False, '
                    +Chr(39)+Copy(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,8],1,length(MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,8]))+Chr(39)+', '
                    +Copy(NomMt,1,Pos(',',NomMt)-1)+');';
      2:StSql:=StSql+Chr(39)+DateStart+Chr(39)+', '
                    +Chr(39)+DateEnd+Chr(39)+', '
                    +'False, '
                    +Chr(39)+CDate+Chr(39)+', '
                    +Copy(NomMt,1,Pos(',',NomMt)-1)+', '
                    +Chr(39)+Dinamika+Chr(39)+', '
                    +Chr(39)+Sposob+Chr(39)+', '
                    +Chr(39)+LPoint+Chr(39)+', '
                    +Chr(39)+NPoint+Chr(39)+');';
      end;
     ADOQ.SQL.Add(StSql);
      ADOQ.ExecSQL;
{
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('INSERT INTO TStreet (Name_Street)');
  ADOSave.SQL.Add('Values ');
  ADOSave.SQL.Add('From TAdd');
  ADOSave.SQL.Add('Where AName_Street<>'+Chr(39)+Chr(39));
  ADOSave.SQL.Add('and not AName_Street = Any(Select Name_Street From TStreet);');
  ADOSave.ExecSQL;
}
    If (NomDiagnoz<=1) and (RgOt.ItemIndex=2) and ((Copy(NomMt,1,Pos(',',NomMt)-1)='157001') or (Copy(NomMt,1,Pos(',',NomMt)-1)='157004')) then
      begin
      If k=4 then
        k:=0;
      Inc(k);
      IF (Copy(NomMt,1,Pos(',',NomMt)-1)='157001') then
      Case k of
        1: LPoint:='На туловище и голове';
        2: LPoint:='На ногах';
        3: LPoint:='На руках';
        4: begin LPoint:=''; NPoint:=''; end;
        end
      else
      Case k of
        1: LPoint:='На ушной раковине';
        2: LPoint:='На ушной раковине';
        3: LPoint:='На ушной раковине';
        4: begin LPoint:=''; NPoint:=''; end;
        end;
      If k<>4 then
        begin
        ADOQ1.Close;
        ADOQ1.SQL.Clear;
        ADOQ1.SQL.Add('Select Name_Point from TPoint');
        ADOQ1.SQL.Add('Where Local_Point = '+Chr(39)+LPoint+Chr(39)+';');
        ADOQ1.ExecSQL;
        ADOQ1.Open;
        ADOQ1.RecNo:=random(ADOQ1.RecordCount)+1;
        NPoint:=AdoQ1.Fields[0].AsString;
{        IF (NomDiagnoz<>1) then
          begin
          LPoint:='';
          NPoint:='';
          end;}
        end;
      end;
    If not ((RgOt.ItemIndex=2) and (k<>4)) then
      begin
      Delete(NomMt,1,Pos(',',NomMt));
      If Copy(NomMt,1,Pos(',',NomMt)-1)='' then
        NomMt:='';
      While (NomMt<>'') and (Cdate<>DateEnd) and ((Copy(NomMt,1,Pos(',',NomMt)-1)='157002') or (Copy(NomMt,1,Pos(',',NomMt)-1)='157003')) do
        Delete(NomMt,1,Pos(',',NomMt));
      end;
    //Создать точки
    If (NomMt='') and (CDate=DateEnd) then
      CDate:='';
    If (NomMt='') and (CDate<>'') and (RgOt.ItemIndex=2) then
      begin
      Case Random(2) of
        0:Dinamika:='Улучшение';
        1:Dinamika:='Без изменений';
        end;
      Case Random(3) of
        0:Sposob:='I/II BBM';
        1:Sposob:='I/II BTM';
        2:Sposob:='ГМ';
        end;
      end;
    IF (RgOt.ItemIndex=2) and (NomMt='') and (CDate<>'') then
      begin
      If (Pos(',',Stdate)<>0) then
        begin
        NomMt:=BaseNomMt;
        IF (NextYear) and (Copy(stDate,5,2)='01') then
          CDate:=Copy(StDate,1,Pos(',',Stdate)-1)+'.'+IntToStr(StrToInt(GodDate)+1)
        else
          CDate:=Copy(StDate,1,Pos(',',Stdate)-1)+'.'+GodDate;
        Delete(StDate,1,Pos(',',Stdate));
        end
      else
        begin
        NomMt:=BaseNomMt;
        CDate:=DateEnd;
        end;
      end
    else
      begin
      if (NomMt='') and (Length(DiagnozOb)>0) then
        begin
        NomMt:=Copy(BaseNomMt,1,Pos(',',BaseNomMt));
        Delete(DiagnozOb,1,z);
        Inc(NomDiagnoz);
        end;
      end;
   If CDate<>'' then
    While  CDate[1]=' ' do
      Delete(CDate,1,1);
    BEnd:=(Length(DiagnozOb)>0) or (NomMt<>'');
    end;

  i:=i+3;
  i:=i-Osh;
  SEnd:=MyExcel.ActiveWorkBook.ActiveSheet.Cells[i,1] ;
  AddTabled;
  ADOQ.Close;
  ADOQ.SQL.Clear;
  ADOQ.SQL.Add('Select * from TAdd;');
  ADOQ.ExecSQL;
  ADOQ.Open;
  For j:=ADOQ.RecordCount downTo 1 do
    begin
    ADOQ.RecNo:=j;
    ADOQ.Delete;
    end;
  end;
end;

procedure TFLoad.btExitOtClick(Sender: TObject);
begin
FLoad.Close;
end;

end.
