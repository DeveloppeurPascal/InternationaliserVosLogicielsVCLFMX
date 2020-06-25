unit Unit2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.VCLUI.Wait, FMX.Forms;

type
  TDataModule2 = class(TDataModule)
    FDMemTable1: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

function _(id, DefaultText: string): string;
function ChangeLangue(Langue: string): boolean;
function GetLangue: string;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses
  System.IOUtils, Unit1;

var
  LangueSelectionnee: string;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  FDMemTable1.LoadFromFile(tpath.Combine(tpath.GetDocumentsPath,
    'MesTextesTraduits.bin'));
end;

function _(id, DefaultText: string): string;
begin
  result := '';
  if assigned(DataModule2) and DataModule2.FDMemTable1.Active then
    if DataModule2.FDMemTable1.Locate('id', id) then
      result := DataModule2.FDMemTable1.fieldbyname(LangueSelectionnee)
        .AsString;
  if result.IsEmpty then
    result := DefaultText;
end;

function ChangeLangue(Langue: string): boolean;
var
  i: integer;
begin
  result := assigned(DataModule2) and DataModule2.FDMemTable1.Active and
    assigned(DataModule2.FDMemTable1.Fields.fieldbyname(Langue));
  if result then
  begin
    LangueSelectionnee := Langue;
    for i := 0 to Screen.FormCount - 1 do
      if (Screen.Forms[i] is TFormTraduite) then
        (Screen.Forms[i] as TFormTraduite).TraduireTextes;
  end;
end;

function GetLangue: string;
begin
  result := LangueSelectionnee;
end;

initialization

LangueSelectionnee := 'fr';

end.
