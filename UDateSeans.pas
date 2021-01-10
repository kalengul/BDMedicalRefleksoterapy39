unit UDateSeans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFAddDateSeans = class(TForm)
    Label1: TLabel;
    D1: TDateTimePicker;
    Label2: TLabel;
    D2: TDateTimePicker;
    Label3: TLabel;
    D3: TDateTimePicker;
    Label4: TLabel;
    D4: TDateTimePicker;
    Label5: TLabel;
    D5: TDateTimePicker;
    Label6: TLabel;
    D6: TDateTimePicker;
    Label7: TLabel;
    D7: TDateTimePicker;
    Label8: TLabel;
    D8: TDateTimePicker;
    Label9: TLabel;
    D9: TDateTimePicker;
    Label10: TLabel;
    D10: TDateTimePicker;
    Label11: TLabel;
    D11: TDateTimePicker;
    Label12: TLabel;
    D12: TDateTimePicker;
    Label13: TLabel;
    D13: TDateTimePicker;
    Label14: TLabel;
    D14: TDateTimePicker;
    Label15: TLabel;
    D15: TDateTimePicker;
    BtAdd: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BtAddClick(Sender: TObject);
    procedure D1Change(Sender: TObject);
    procedure D2Change(Sender: TObject);
    procedure D3Change(Sender: TObject);
    procedure D4Change(Sender: TObject);
    procedure D5Change(Sender: TObject);
    procedure D6Change(Sender: TObject);
    procedure D7Change(Sender: TObject);
    procedure D8Change(Sender: TObject);
    procedure D9Change(Sender: TObject);
    procedure D10Change(Sender: TObject);
    procedure D11Change(Sender: TObject);
    procedure D12Change(Sender: TObject);
    procedure D13Change(Sender: TObject);
    procedure D14Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddDateSeans: TFAddDateSeans;

implementation

Uses uAddS;

{$R *.dfm}

procedure TFAddDateSeans.FormActivate(Sender: TObject);
begin
D2.Visible:=FAddS.SeKolSeans.Value>=2;
Label2.Visible:=FAddS.SeKolSeans.Value>=2;
D3.Visible:=FAddS.SeKolSeans.Value>=3;
Label3.Visible:=FAddS.SeKolSeans.Value>=3;
D4.Visible:=FAddS.SeKolSeans.Value>=4;
Label4.Visible:=FAddS.SeKolSeans.Value>=4;
D5.Visible:=FAddS.SeKolSeans.Value>=5;
Label5.Visible:=FAddS.SeKolSeans.Value>=5;
D6.Visible:=FAddS.SeKolSeans.Value>=6;
Label6.Visible:=FAddS.SeKolSeans.Value>=6;
D7.Visible:=FAddS.SeKolSeans.Value>=7;
Label7.Visible:=FAddS.SeKolSeans.Value>=7;
D8.Visible:=FAddS.SeKolSeans.Value>=8;
Label8.Visible:=FAddS.SeKolSeans.Value>=8;
D9.Visible:=FAddS.SeKolSeans.Value>=9;
Label9.Visible:=FAddS.SeKolSeans.Value>=9;
D10.Visible:=FAddS.SeKolSeans.Value>=10;
Label10.Visible:=FAddS.SeKolSeans.Value>=10;
D11.Visible:=FAddS.SeKolSeans.Value>=11;
Label11.Visible:=FAddS.SeKolSeans.Value>=11;
D12.Visible:=FAddS.SeKolSeans.Value>=12;
Label12.Visible:=FAddS.SeKolSeans.Value>=12;
D13.Visible:=FAddS.SeKolSeans.Value>=13;
Label13.Visible:=FAddS.SeKolSeans.Value>=13;
D14.Visible:=FAddS.SeKolSeans.Value>=14;
Label14.Visible:=FAddS.SeKolSeans.Value>=14;
D15.Visible:=FAddS.SeKolSeans.Value=15;
Label15.Visible:=FAddS.SeKolSeans.Value=15;
D1.Date:=date;
D2.Date:=D1.Date+1;
D3.Date:=D2.Date+1;
D4.Date:=D3.Date+1;
D5.Date:=D4.Date+1;
D6.Date:=D5.Date+1;
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.BtAddClick(Sender: TObject);
begin
FAddS.MeDate.Clear;
FAddS.MeDate.Lines.Add(dateToStr(d1.Date));
if FAddS.SeKolSeans.Value>=2 then
  FAddS.MeDate.Lines.Add(dateToStr(d2.Date));
if FAddS.SeKolSeans.Value>=3 then
  FAddS.MeDate.Lines.Add(dateToStr(d3.Date));
if FAddS.SeKolSeans.Value>=4 then
  FAddS.MeDate.Lines.Add(dateToStr(d4.Date));
if FAddS.SeKolSeans.Value>=5 then
  FAddS.MeDate.Lines.Add(dateToStr(d5.Date));
if FAddS.SeKolSeans.Value>=6 then
  FAddS.MeDate.Lines.Add(dateToStr(d6.Date));
if FAddS.SeKolSeans.Value>=7 then
  FAddS.MeDate.Lines.Add(dateToStr(d7.Date));
if FAddS.SeKolSeans.Value>=8 then
  FAddS.MeDate.Lines.Add(dateToStr(d8.Date));
if FAddS.SeKolSeans.Value>=9 then
  FAddS.MeDate.Lines.Add(dateToStr(d9.Date));
if FAddS.SeKolSeans.Value>=10 then
  FAddS.MeDate.Lines.Add(dateToStr(d10.Date));
if FAddS.SeKolSeans.Value>=11 then
  FAddS.MeDate.Lines.Add(dateToStr(d11.Date));
if FAddS.SeKolSeans.Value>=12 then
  FAddS.MeDate.Lines.Add(dateToStr(d12.Date));
if FAddS.SeKolSeans.Value>=13 then
  FAddS.MeDate.Lines.Add(dateToStr(d13.Date));
if FAddS.SeKolSeans.Value>=14 then
  FAddS.MeDate.Lines.Add(dateToStr(d14.Date));
if FAddS.SeKolSeans.Value=15 then
  FAddS.MeDate.Lines.Add(dateToStr(d15.Date));
FAddDateSeans.Close;
end;

procedure TFAddDateSeans.D1Change(Sender: TObject);
begin
D2.Date:=D1.Date+1;
D3.Date:=D2.Date+1;
D4.Date:=D3.Date+1;
D5.Date:=D4.Date+1;
D6.Date:=D5.Date+1;
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D2Change(Sender: TObject);
begin
D3.Date:=D2.Date+1;
D4.Date:=D3.Date+1;
D5.Date:=D4.Date+1;
D6.Date:=D5.Date+1;
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D3Change(Sender: TObject);
begin
D4.Date:=D3.Date+1;
D5.Date:=D4.Date+1;
D6.Date:=D5.Date+1;
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D4Change(Sender: TObject);
begin
D5.Date:=D4.Date+1;
D6.Date:=D5.Date+1;
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D5Change(Sender: TObject);
begin
D6.Date:=D5.Date+1;
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D6Change(Sender: TObject);
begin
D7.Date:=D6.Date+1;
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D7Change(Sender: TObject);
begin
D8.Date:=D7.Date+1;
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D8Change(Sender: TObject);
begin
D9.Date:=D8.Date+1;
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D9Change(Sender: TObject);
begin
D10.Date:=D9.Date+1;
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D10Change(Sender: TObject);
begin
D11.Date:=D10.Date+1;
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D11Change(Sender: TObject);
begin
D12.Date:=D11.Date+1;
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D12Change(Sender: TObject);
begin
D13.Date:=D12.Date+1;
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D13Change(Sender: TObject);
begin
D14.Date:=D13.Date+1;
D15.Date:=D14.Date+1;
end;

procedure TFAddDateSeans.D14Change(Sender: TObject);
begin
D15.Date:=D14.Date+1;
end;

end.
