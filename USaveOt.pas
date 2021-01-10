unit USaveOt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, ComObj, ActiveX, ComCtrls;

const
  ExcelApp = 'Excel.Application';


type
  TFSaveOt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RgOt: TRadioGroup;
    BtsaveOt: TButton;
    btExitOt: TButton;
    ADOSave: TADOQuery;
    ADOQ: TADOQuery;
    LeGod: TLabeledEdit;
    Label3: TLabel;
    CbMesats: TComboBox;
    ADOQ1: TADOQuery;
    CbGodOtchet: TCheckBox;
    RgGodOt: TRadioGroup;
    CbDay: TCheckBox;
    Label4: TLabel;
    DTPDate: TDateTimePicker;
    btSave1: TButton;
    procedure btExitOtClick(Sender: TObject);
    procedure BtsaveOtClick(Sender: TObject);
    procedure CbGodOtchetClick(Sender: TObject);
    procedure CbDayClick(Sender: TObject);
    procedure btSave1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaveOt: TFSaveOt;
  MyExcel: OleVariant;

function CheckExcelRun: boolean;  

implementation

Uses UMainForm;

{$R *.dfm}

procedure TFSaveOt.btExitOtClick(Sender: TObject);
begin
FSaveOt.Enabled:=false;
FSaveOt.Visible:=false;
end;

function CheckExcelRun: boolean;
begin
  try
    MyExcel:=GetActiveOleObject(ExcelApp);
    Result:=True;
  except
    Result:=false;
  end;
end;

procedure TFSaveOt.BtsaveOtClick(Sender: TObject);
var
  i,j:Longword;
  KOlMt:array [1..16] of word;
  nom:byte;
  KolPos,KolKonsult,KolNatLech,KolKonLesh:longWord;
  st,St1,st2,StMes:string;
begin
CheckExcelRun;
if CbGodOtchet.Checked then
  begin
  If RgGodOt.ItemIndex=0 then
    MyExcel.ActiveWorkBook.ActiveSheet.Cells[1,1]:='Количество проведенных процедур за '+LeGod.Text+' год'
  else
    MyExcel.ActiveWorkBook.ActiveSheet.Cells[1,1]:='Количество посещений, принятых больных за '+LeGod.Text+' год';
  For i:=1 to 12 do
    If RgGodOt.ItemIndex=0 then
      begin
      For j:=1 to 16 do
        KolMt[j]:=0;
      StMes:=IntToStr(i);
      If i<10 then
        StMes:='0'+StMes;
      ADOSave.Close;
      ADOSave.SQL.Clear;
      ADOSave.SQL.Add('Select Id_Seans, IdS_Mt, IdS');
      ADOSave.SQL.Add('From TSeans, TSMethod');
      ADOSave.SQL.Add('Where IdS_Method = Id_Seans');
      ADOSave.SQL.Add('And Date_Seans Like '+Chr(39)+'%'+StMes+'.'+LeGod.Text+Chr(39));
      ADOSave.ExecSQL;
      ADOSave.Open;
      For j:=1 to ADOSave.RecordCount do
        begin
        ADOSave.RecNo:=j;
        nom:=StrToInt(ADOSave.Fields[1].asString);
        inc(KolMt[nom])
        end;
      For j:=1 to 16 do
        MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,j+1]:=KolMt[j];
      end
    else
      begin
      StMes:=IntToStr(i);
      If i<10 then
        StMes:='0'+StMes;
      KolPos:=0; KolKonsult:=0; KolNatLech:=0; KolKonLesh:=0;
      ADOSave.Close;
      ADOSave.SQL.Clear;
      ADOSave.SQL.Add('Select Id_Seans');
      ADOSave.SQL.Add('From TSeans');
      ADOSave.SQL.Add('Where Date_Seans Like '+Chr(39)+'%'+StMes+'.'+LeGod.Text+Chr(39)+';');
      ADOSave.ExecSQL;
      ADOSave.Open;
      KolPos:=ADOSave.RecordCount;
      ADOSave.Close;
      ADOSave.SQL.Clear;
      ADOSave.SQL.Add('Select Id_Kyrs');
      ADOSave.SQL.Add('From TKyrs');
      ADOSave.SQL.Add('Where Konsult = false');
      ADOSave.SQL.Add('And DateStart_Kyrs Like '+Chr(39)+'%'+StMes+'.'+LeGod.Text+Chr(39)+';');
      ADOSave.ExecSQL;
      ADOSave.Open;
      KolNatLech:=ADOSave.RecordCount;
      ADOSave.Close;
      ADOSave.SQL.Clear;
      ADOSave.SQL.Add('Select Id_Kyrs');
      ADOSave.SQL.Add('From TKyrs');
      ADOSave.SQL.Add('Where Konsult = false');
      ADOSave.SQL.Add('And DateEnd_Kyrs Like '+Chr(39)+'%'+StMes+'.'+LeGod.Text+Chr(39)+';');
      ADOSave.ExecSQL;
      ADOSave.Open;
      KolKOnLesh:=ADOSave.RecordCount;
      ADOSave.Close;
      ADOSave.SQL.Clear;
      ADOSave.SQL.Add('Select Id_Kyrs');
      ADOSave.SQL.Add('From TKyrs');
      ADOSave.SQL.Add('Where Konsult = true');
      ADOSave.SQL.Add('And DateStart_Kyrs Like '+Chr(39)+'%'+StMes+'.'+LeGod.Text+Chr(39)+';');
      ADOSave.ExecSQL;
      ADOSave.Open;
      KolKonsult:=ADOSave.RecordCount;
      MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,2]:= KolPos;
      MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,8]:= KolNatLech;
      MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,9]:= KolKOnLesh;
      MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,3]:= KolKonsult;
      end;
  end
else
  begin
     StMes:=IntToStr(CbMesats.ItemIndex+1);
     If i<10 then
       StMes:='0'+StMes;
     ADOSave.Close;
     ADOSave.SQL.Clear;
     ADOSave.SQL.Add('Select Id_Person, Family, Name, SName, date_Rozhd, Nom_Polis, Name_Street, Address, dateStart_Kyrs,DateEnd_Kyrs, Nom_Kyrs, Nom_Person, Id_Kyrs');
     ADOSave.SQL.Add('From TPerson, TKyrs, TStreet');
     ADOSave.SQL.Add('Where Id_Person = Id_Person_Kyrs');
     If RgOt.ItemIndex=0 then
       ADOSave.SQL.Add('And Konsult = true')
     else
       ADOSave.SQL.Add('And Konsult = false');
     ADOSave.SQL.Add('And Id_Street=Id_Street_Person');
     ADOSave.SQL.Add('And dateStart_Kyrs Like '+Chr(39)+'%'+StMes+'.'+LeGod.Text+Chr(39));
     ADOSave.SQL.Add('Order By DateStart_Kyrs;');
     ADOSave.ExecSQL;
     ADOSave.Open;
     If RgOt.ItemIndex=0 then
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[1,1]:=CbMesats.Text+' '+LeGod.Text+' (консультации)'
     else
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[1,1]:=CbMesats.Text+' '+LeGod.Text;
     For i:=1 to ADOSave.RecordCount do
       begin
       ADOSave.RecNo:=i;
       ADOQ.Close;
       ADOQ.SQL.Clear;
       ADOQ.SQL.Add('Select Distinct Diagnoz, Shifr_Diagnoz');
       ADOQ.SQL.Add('From TSDiagnoz, TDiagnoz, TKyrs');
       ADOQ.SQL.Add('Where Id_Diagnoz=IdS_Diagnoz');
       ADOQ.SQL.Add('and IdS_Diagnoz_Kyrs = '+ADOSave.Fields[12].AsString+';');
       ADOQ.ExecSQL;
       ADOQ.Open;
       st:='';
       For j:=1 to ADOQ.RecordCount do
         begin
         ADOQ.RecNo:=j;
         St:=st+ADOQ.Fields[0].AsString+' '+ADOQ.Fields[1].AsString+'; ';
         end;
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,1]:=i;
       If (RgOt.ItemIndex=2) and (ADOSave.Fields[11].AsString<>'-1') then
         MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,2]:=ADOSave.Fields[1].AsString+' '+ADOSave.Fields[2].AsString+' '+ADOSave.Fields[3].AsString+' '+ADOSave.Fields[11].AsString
       else
         MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,2]:=ADOSave.Fields[1].AsString+' '+ADOSave.Fields[2].AsString+' '+ADOSave.Fields[3].AsString;
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,3]:=ADOSave.Fields[4].AsString;
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,4]:=st;
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,5]:=ADOSave.Fields[5].AsString;
       MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,6]:=ADOSave.Fields[6].AsString+' '+ADOSave.Fields[7].AsString;
       If RgOt.ItemIndex=0 then
         begin
         MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,7]:=ADOSave.Fields[8].AsString;
         MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,8]:='101602';
         end
       else
         begin
         ADOQ.Close;
         ADOQ.SQL.Clear;
         ADOQ.SQL.Add('Select Distinct Name_Mt, Nom_Mt');
         ADOQ.SQL.Add('From TMethod, TSeans, TKyrs, TSMethod');
         ADOQ.SQL.Add('Where Id_Mt=IdS_Mt');
         ADOQ.SQL.Add('And IdS_Method=Id_Seans');
         ADOQ.SQL.Add('and Id_Kyrs_Seans = '+ADOSave.Fields[12].AsString+';');
         ADOQ.ExecSQL;
         ADOQ.Open;
         st:='';
         For j:=1 to ADOQ.RecordCount do
           begin
           ADOQ.RecNo:=j;
           St:=st+ADOQ.Fields[1].AsString+'; ';
           end;
         If Rgot.ItemIndex=1 then
           begin
           ADOQ.Close;
           ADOQ.SQL.Clear;
           ADOQ.SQL.Add('Select Distinct Date_Seans');
           ADOQ.SQL.Add('From TSeans, TKyrs');
           ADOQ.SQL.Add('Where Id_Kyrs_Seans = '+ADOSave.Fields[12].AsString+';');
           ADOQ.ExecSQL;
           ADOQ.Open;
           st1:='';
           For j:=1 to ADOQ.RecordCount do
             begin
             ADOQ.RecNo:=j;
             St1:=st1+ADOQ.Fields[0].AsString+', ';
             end;
           MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,7]:=St1;
           MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,8]:=St;
           end
         else
           begin
           MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,7]:=ADOSave.Fields[10].AsString;
           MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,8]:=ADOSave.Fields[8].AsString;
           MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,9]:=ADOSave.Fields[9].AsString;
           MyExcel.ActiveWorkBook.ActiveSheet.Cells[i+2,10]:=St;
           end;
         end;
       end;
     end;
ShowMessage('Данные успешно сохранены');
end;

procedure TFSaveOt.CbGodOtchetClick(Sender: TObject);
begin
RgGodOt.Visible:=CbGodOtchet.Checked;
RgOt.Visible:= not CbGodOtchet.Checked;
CbMesats.Visible:= not CbGodOtchet.Checked;
Label3.Visible:= not CbGodOtchet.Checked;
end;

procedure TFSaveOt.CbDayClick(Sender: TObject);
begin
CbGodOtchet.Visible:=not CbDay.Checked;
RgGodOt.Visible:=not CbDay.Checked;
RgOt.Visible:=not CbDay.Checked;
CbMesats.Visible:=not CbDay.Checked;
Label3.Visible:=not CbDay.Checked;
LeGod.Visible:=not CbDay.Checked;
Label4.Visible:=CbDay.Checked;
DTPDate.Visible:=CbDay.Checked;
btSave1.Visible:=CbDay.Checked;
end;

procedure TFSaveOt.btSave1Click(Sender: TObject);
var
j,i,k:longWord;
St:String;
begin
CheckExcelRun;
  ADOSave.Close;
  ADOSave.SQL.Clear;
  ADOSave.SQL.Add('Select Id_Person, Family, Name, SName, Id_Seans');
  ADOSave.SQL.Add('From TPerson, TKyrs, TSeans');
  ADOSave.SQL.Add('Where Id_Person = Id_Person_Kyrs');
  ADOSave.SQL.Add('And Id_Kyrs=Id_Kyrs_Seans');
//  ADOSave.SQL.Add('And Id_Seans=IdS_Method');
//  ADOSave.SQL.Add('And IdS_Mt=Id_Mt');
  St:=Chr(39)+DateToStr(DTPDate.Date)+Chr(39);
  ADOSave.SQL.Add('And Date_Seans = '+St);
  ADOSave.SQL.Add('Order By Family;');
  ADOSave.ExecSQL;
  ADOSave.Open;
  MyExcel.ActiveWorkBook.ActiveSheet.Cells[1,2]:=st;
  k:=2;
  For j:=1 to ADOSave.RecordCount do
    begin
    ADOSave.RecNo:=j;
    st:=ADOSave.Fields[1].AsString+' '+ADOSave.Fields[2].AsString+' '+ADOSave.Fields[3].AsString;
    MyExcel.ActiveWorkBook.ActiveSheet.Cells[k+1,1]:=st;
    ADOQ.Close;
    ADOQ.SQL.Clear;
    ADOQ.SQL.Add('Select Nom_Mt');
    ADOQ.SQL.Add('From TSMethod, TMethod');
    ADOQ.SQL.Add('Where IdS_Method = '+ADOSave.Fields[4].AsString);
    ADOQ.SQL.Add('And IdS_Mt = Id_Mt');
    ADOQ.ExecSQL;
    ADOQ.Open;
    For i:=1 to ADOQ.RecordCount do
      begin
      ADOQ.RecNo:=i;
      MyExcel.ActiveWorkBook.ActiveSheet.Cells[k+1,2]:=ADOQ.Fields[0].AsString;
      Inc(k);
      end;
    end;
ShowMessage('Данные успешно сохранены');    
end;

end.
