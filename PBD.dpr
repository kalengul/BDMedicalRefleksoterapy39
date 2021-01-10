program PBD;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {FMain},
  USeans in 'USeans.pas' {FSeans},
  UAddP in 'UAddP.pas' {FAddP},
  UAddK in 'UAddK.pas' {FAddK},
  UVivodDate in 'UVivodDate.pas' {FDate},
  UAddS in 'UAddS.pas' {FAddS},
  USaveOt in 'USaveOt.pas' {FSaveOt},
  UDateSeans in 'UDateSeans.pas' {FAddDateSeans},
  ULoadOt in 'ULoadOt.pas' {FLoad},
  UKoliz in 'UKoliz.pas' {FKoliz},
  UChangePolis in 'UChangePolis.pas' {FChangePolis},
  UChangeDiagnoz in 'UChangeDiagnoz.pas' {FChangeDiagnoz},
  UOtkat in 'UOtkat.pas' {FOtkat};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSeans, FSeans);
  Application.CreateForm(TFAddP, FAddP);
  Application.CreateForm(TFAddK, FAddK);
  Application.CreateForm(TFDate, FDate);
  Application.CreateForm(TFAddS, FAddS);
  Application.CreateForm(TFSaveOt, FSaveOt);
  Application.CreateForm(TFAddDateSeans, FAddDateSeans);
  Application.CreateForm(TFLoad, FLoad);
  Application.CreateForm(TFKoliz, FKoliz);
  Application.CreateForm(TFChangePolis, FChangePolis);
  Application.CreateForm(TFChangeDiagnoz, FChangeDiagnoz);
  Application.CreateForm(TFOtkat, FOtkat);
  Application.Run;
end.
