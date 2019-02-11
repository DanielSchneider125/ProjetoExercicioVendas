unit CadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait;

type
  TFProdutos = class(TForm)
    PnFundo: TPanel;
    TBProdutos: TFDTable;
    TBProdutosID: TIntegerField;
    TBProdutosNome: TStringField;
    TBProdutosDescricao: TStringField;
    TBProdutosCusto: TCurrencyField;
    DSProdutos: TDataSource;
    LbID: TLabel;
    EdID: TDBEdit;
    LbNome: TLabel;
    EdNome: TDBEdit;
    LbDescricao: TLabel;
    LbCusto: TLabel;
    EdCusto: TDBEdit;
    LbMargem: TLabel;
    EdMargem: TDBEdit;
    MnDescricao: TDBMemo;
    PnButtons: TPanel;
    BtGravar: TButton;
    BtCancelar: TButton;
    TBProdutosMargem: TFloatField;
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
  private
  public
    ID: Integer;
    DBConexao: TFDConnection;
    procedure AdicionaProduto;
    procedure EditarProduto(ID: Integer);
  end;

var
  FProdutos: TFProdutos;

implementation

{$R *.dfm}
{ TFProdutos }

{ TFProdutos }

procedure TFProdutos.AdicionaProduto;
var
  Query: TFDQuery;
begin
  TBProdutos.Connection := DBConexao;
  TBProdutos.TableName := 'Produtos';
  TBProdutos.Open();

  TBProdutos.Append;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DBConexao;
    Query.SQL.Text := 'SELECT CASE WHEN MAX(ID) IS NULL THEN 1 ELSE (MAX(ID) +1) END ID FROM PRODUTOS';
    Query.Open();
    TBProdutos.FieldByName('ID').AsInteger := Query.FieldByName('ID').AsInteger;
  finally
    Query.free;
  end;

  ShowModal;
end;

procedure TFProdutos.BtCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFProdutos.BtGravarClick(Sender: TObject);
begin
  TBProdutos.Post;
  DBConexao.Commit;
  Close;
end;

procedure TFProdutos.EditarProduto(ID: Integer);
begin
  TBProdutos.Connection := DBConexao;
  TBProdutos.TableName := 'Produtos';
  TBProdutos.Open();

  if ID > 0 then
  begin
    TBProdutos.First;
    while not TBProdutos.Eof do
    begin
      if TBProdutos['id'] = ID then
        break;
      TBProdutos.Next;
    end;
    TBProdutos.Edit;
  end;

  ShowModal;

end;

end.
