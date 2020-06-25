unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB, FMX.Layouts,
  FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;

type
  TForm1 = class(TForm)
    FDMemTable1: TFDMemTable;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    FDMemTable1id: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMemTable1fr: TMemoField;
    FDMemTable1en: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDMemTable1BeforeOpen(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.IOUtils;

procedure TForm1.FDMemTable1BeforeOpen(DataSet: TDataSet);
begin
  FDMemTable1.ResourceOptions.Persistent := true;
  FDMemTable1.ResourceOptions.PersistentFileName :=
    tpath.combine(tpath.GetDocumentsPath, 'MesTextesTraduits.bin');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDMemTable1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDMemTable1.Open;
end;

end.
