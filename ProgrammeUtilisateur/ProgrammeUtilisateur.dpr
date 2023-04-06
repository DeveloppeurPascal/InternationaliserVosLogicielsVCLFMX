program ProgrammeUtilisateur;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit2 in 'Unit2.pas' {DataModule2: TDataModule},
  Unit1 in 'Unit1.pas' {FormTraduite},
  Unit3 in 'Unit3.pas' {Form1},
  Unit4 in 'Unit4.pas' {Fiche2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFiche2, Fiche2);
  Application.Run;
end.
