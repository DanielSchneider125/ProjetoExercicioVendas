unit FItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Vcl.StdCtrls,
  Data.Win.ADODB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFCarrinho = class(TForm)
    FDConexao: TFDConnection;
    TBProdutos: TFDTable;
    DSProdutos: TDataSource;
    TBProdutosID: TIntegerField;
    TBProdutosNome: TStringField;
    TBProdutosDescricao: TStringField;
    TBProdutosCusto: TCurrencyField;
    TBProdutosMargem: TCurrencyField;
    TbGrid: TFDMemTable;
    TbGridID: TIntegerField;
    TbGridNome: TStringField;
    TbGridDescricao: TStringField;
    TbGridCusto: TCurrencyField;
    TbGridMargem: TCurrencyField;
    pnFundo: TPanel;
    PgControl: TPageControl;
    TsProdutos: TTabSheet;
    Carrinho: TTabSheet;
    PnProdutos: TPanel;
    GridProdutos: TDBGrid;
    TbGridCarrinho: TFDMemTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    TbGridCarrinhoQuantidade: TCurrencyField;
    TbGridCarrinhoPreco: TCurrencyField;
    DSProdutosCarrinho: TDataSource;
    PnProdutosBottom: TPanel;
    BtCarrinho: TButton;
    BtAddCarrinho: TButton;
    PnFundoCarrinho: TPanel;
    GridCarrinho: TDBGrid;
    PnTopCarrinho: TPanel;
    PnBottomCarrinho: TPanel;
    TbGridCarrinhoCusto: TCurrencyField;
    TbGridCarrinhoMargem: TCurrencyField;
    EdValor: TEdit;
    TbGridCarrinhoTotal: TCurrencyField;
    EdTotal: TEdit;
    LbTotal: TLabel;
    LbDespesas: TLabel;
    TbCarrinhoProdutos: TFDTable;
    IntegerField2: TIntegerField;
    TbCarrinho: TFDTable;
    IntegerField3: TIntegerField;
    TbCarrinhoDespesas: TCurrencyField;
    TbCarrinhoTotal: TCurrencyField;
    TbCarrinhoProdutosIdProduto: TIntegerField;
    TbCarrinhoProdutosIdVenda: TIntegerField;
    TbCarrinhoProdutosQuantidade: TCurrencyField;
    TbCarrinhoProdutosPreco: TCurrencyField;
    BtSalvar: TButton;
    BtAddProduto: TButton;
    TbGridS: TBooleanField;
    BtEditarProduto: TButton;
    TbCarrinhoProdutosCusto: TCurrencyField;
    TbCarrinhoProdutosMargem: TFloatField;
    BtCarregar: TButton;
    BtLimpar: TButton;
    TbCarrinhoProdutosNome: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure GridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GridProdutosCellClick(Column: TColumn);
    procedure BtCarrinhoClick(Sender: TObject);
    procedure EdValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdValorExit(Sender: TObject);
    procedure BtAddCarrinhoClick(Sender: TObject);
    procedure GridCarrinhoColExit(Sender: TObject);
    procedure GridCarrinhoColEnter(Sender: TObject);
    procedure GridCarrinhoKeyPress(Sender: TObject; var Key: Char);
    procedure GridCarrinhoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtAddProdutoClick(Sender: TObject);
    procedure GridProdutosDblClick(Sender: TObject);
    procedure BtEditarProdutoClick(Sender: TObject);
    procedure BtCarregarClick(Sender: TObject);
    procedure BtLimparClick(Sender: TObject);
  private
    ID: Integer;
    procedure CalculaPrecoItens;
    procedure CarregaProdutos;
    procedure Limpar;
  public
    { Public declarations }
  end;

var
  FCarrinho: TFCarrinho;

implementation

{$R *.dfm}

uses CadastroProdutos, LocalizaCarrinho;

procedure TFCarrinho.BtAddCarrinhoClick(Sender: TObject);
var
  Tem: Boolean;
begin
  Tem := False;
  TbGrid.First;
  while not TbGrid.Eof do
  begin
    if TbGrid.FieldByName('S').AsBoolean then
    begin
      TbGridCarrinho.Append;
      TbGridCarrinho['id'] := TbGrid['id'];
      TbGridCarrinho['Nome'] := TbGrid['Nome'];
      TbGridCarrinho['Margem'] := TbGrid['Margem'];
      TbGridCarrinho['custo'] := TbGrid['custo'];
      TbGridCarrinho['Quantidade'] := 1;
      TbGridCarrinho['Preco'] := 0;
      TbGridCarrinho.Post;
      Tem := True;
    end;
    TbGrid.Next;
  end;
  TbGrid.First;

  if Tem then
  begin
    CalculaPrecoItens;
    PgControl.TabIndex := 1;
  end;
end;

procedure TFCarrinho.BtAddProdutoClick(Sender: TObject);
var
  TelaProduto: TFProdutos;
begin
  TelaProduto := TFProdutos.Create(nil);
  try
    TelaProduto.DBConexao := FDConexao;
    TelaProduto.AdicionaProduto;
    TBProdutos.Refresh;
  finally
    TelaProduto.Free;
  end;
  CarregaProdutos;
end;

procedure TFCarrinho.BtCarregarClick(Sender: TObject);
var
  TelaLocalizaCarrinho: TFLocalizaCarrinho;
begin
  if TbGridCarrinho.RecordCount > 0 then
    if not(MessageDlg('Ao carregar um carrinho antigo os dados lan�ados ser�o perdidos. Deseja continuar?',
      mtConfirmation, mbOKCancel, 0) = mrOk) then
      Exit;
  Limpar;
  TelaLocalizaCarrinho := TFLocalizaCarrinho.Create(nil);

  try
    TelaLocalizaCarrinho.DBConexao := FDConexao;
    TelaLocalizaCarrinho.LocalizaCarrinho;
    if TelaLocalizaCarrinho.ShowModal = mrOk then
    begin
      ID := TelaLocalizaCarrinho.ID;
      TbCarrinhoProdutos.Filter := 'IdVenda = ' + IntToStr(ID);
      TbCarrinho.Filter := 'Id = ' + IntToStr(ID);
      TbCarrinhoProdutos.Filtered := True;
      TbCarrinho.Filtered := True;

      TbCarrinhoProdutos.First;
      while not TbCarrinhoProdutos.Eof do
      begin
        TbGridCarrinho.Append;
        TbGridCarrinho['id'] := TbCarrinhoProdutos['idProduto'];
        TbGridCarrinho['Nome'] := TbCarrinhoProdutos['Nome'];
        TbGridCarrinho['Margem'] := TbCarrinhoProdutos['Margem'];
        TbGridCarrinho['custo'] := TbCarrinhoProdutos['custo'];
        TbGridCarrinho['Quantidade'] := TbCarrinhoProdutos['Quantidade'];
        TbGridCarrinho['Preco'] := TbCarrinhoProdutos['Preco'];
        TbGridCarrinho.Post;
        TbCarrinhoProdutos.Next;
      end;
      TbGridCarrinho.First;

      EdValor.Text := TbCarrinho.FieldByName('despesas').AsString;
      CalculaPrecoItens;
    end;

  finally
    TelaLocalizaCarrinho.Free;
    TbCarrinhoProdutos.Filter := '';
    TbCarrinho.Filter := '';
    TbCarrinhoProdutos.Filtered := False;
    TbCarrinho.Filtered := False;
  end;

end;

procedure TFCarrinho.BtCarrinhoClick(Sender: TObject);
begin
  PgControl.TabIndex := 1;
end;

procedure TFCarrinho.BtEditarProdutoClick(Sender: TObject);
var
  TelaProduto: TFProdutos;
begin
  TelaProduto := TFProdutos.Create(nil);
  try
    TelaProduto.DBConexao := FDConexao;
    TelaProduto.EditarProduto(TBProdutos.FieldByName('ID').AsInteger);
    TBProdutos.Refresh;
  finally
    TelaProduto.Free;
  end;
  CarregaProdutos;
end;

procedure TFCarrinho.BtSalvarClick(Sender: TObject);
var
  Query: TFDQuery;
  IDVenda: Integer;
begin
  if MessageDlg('Deseja finalizar?', mtConfirmation, mbOKCancel, 0) = mrCancel then
    Exit;

  if ID = 0 then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := FDConexao;
      Query.SQL.Text := 'SELECT CASE WHEN MAX(ID) IS NULL THEN 1 ELSE (MAX(ID) +1) END ID FROM CARRINHO';
      Query.Open();
      IDVenda := Query.FieldByName('ID').AsInteger;
      TbCarrinho.InsertRecord([IDVenda, EdValor.Text, EdTotal.Text]);

      TbGridCarrinho.First;
      while not TbGridCarrinho.Eof do
      begin
        Query.Close;
        Query.SQL.Text := 'SELECT CASE WHEN MAX(ID) IS NULL THEN 1 ELSE (MAX(ID) +1) END ID FROM CARRINHOPRODUTOS';
        Query.Open();
        TbCarrinhoProdutos.InsertRecord([Query.FieldByName('ID').AsInteger, TbGridCarrinho.FieldByName('ID').AsCurrency,
          IDVenda, TbGridCarrinho.FieldByName('Quantidade').AsCurrency, TbGridCarrinho.FieldByName('Preco').AsCurrency,
          TbGridCarrinho.FieldByName('Custo').AsCurrency, TbGridCarrinho.FieldByName('Margem').AsCurrency]);
        TbGridCarrinho.Next;
      end;
    finally
      Query.Free;
    end;
  end
  else
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := FDConexao;
      Query.SQL.Text := 'UPDATE CARRINHO SET DESPESAS = :DESPESAS, TOTAL = :TOTAL WHERE ID = :ID';
//      Query.Prepare;
      Query.ParamByName('DESPESAS').AsCurrency := StrToCurr(EdValor.Text);
      Query.ParamByName('TOTAL').AsCurrency := StrToCurr(EdTotal.Text);
      Query.ParamByName('ID').AsInteger := ID;
      Query.ExecSQL;

      Query.SQL.Text := 'DELETE FROM CARRINHOPRODUTOS WHERE IDVENDA = :ID';
  //    Query.Prepare;
      Query.ParamByName('ID').AsInteger := ID;
      Query.ExecSQL;

      TbGridCarrinho.First;
      while not TbGridCarrinho.Eof do
      begin
        Query.Close;
        Query.SQL.Text := 'SELECT CASE WHEN MAX(ID) IS NULL THEN 1 ELSE (MAX(ID) +1) END ID FROM CARRINHOPRODUTOS';
        Query.Open();
        TbCarrinhoProdutos.InsertRecord([Query.FieldByName('ID').AsInteger, TbGridCarrinho.FieldByName('ID').AsCurrency,
          IDVenda, TbGridCarrinho.FieldByName('Quantidade').AsCurrency, TbGridCarrinho.FieldByName('Preco').AsCurrency,
          TbGridCarrinho.FieldByName('Custo').AsCurrency, TbGridCarrinho.FieldByName('Margem').AsCurrency]);
        TbGridCarrinho.Next;
      end;
    finally
      Query.Free;
    end;
  end;
  Limpar;
end;

procedure TFCarrinho.BtLimparClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja limpar?', mtConfirmation, mbOKCancel, 0) = mrOk then
    Limpar;
end;

procedure TFCarrinho.Limpar;
begin
  TbGridCarrinho.EmptyDataSet;
  TbGridCarrinho.Refresh;
  GridCarrinho.Refresh;
  EdValor.Text := '400,00';
  EdTotal.Text := '0,00';
end;

procedure TFCarrinho.CalculaPrecoItens;
var
  QtdeTotal, CustoTotal, Total: Currency;
  RateioDespesas: Double;
begin
  QtdeTotal := 0;
  CustoTotal := 0;
  RateioDespesas := 0;
  Total := 0;
  TbGridCarrinho.First;
  while not TbGridCarrinho.Eof do
  begin
    QtdeTotal := QtdeTotal + TbGridCarrinho.FieldByName('Quantidade').AsCurrency;
    TbGridCarrinho.Next;
  end;

  RateioDespesas := StrToCurr(EdValor.Text) / QtdeTotal;

  TbGridCarrinho.First;
  while not TbGridCarrinho.Eof do
  begin
    TbGridCarrinho.Edit;

    CustoTotal := (TbGridCarrinho.FieldByName('Quantidade').AsCurrency * RateioDespesas) +
      (TbGridCarrinho.FieldByName('Quantidade').AsCurrency * TbGridCarrinho.FieldByName('Custo').AsCurrency);

    TbGridCarrinho.FieldByName('Preco').AsCurrency := CustoTotal +
      (CustoTotal * TbGridCarrinho.FieldByName('Margem').AsCurrency / 100);

    TbGridCarrinho.FieldByName('Total').AsCurrency := TbGridCarrinho.FieldByName('Quantidade').AsCurrency *
      TbGridCarrinho.FieldByName('Preco').AsCurrency;
    TbGridCarrinho.Post;
    TbGridCarrinho.Next;
  end;

  TbGridCarrinho.First;
  while not TbGridCarrinho.Eof do
  begin
    Total := Total + TbGridCarrinho.FieldByName('Total').AsCurrency;
    TbGridCarrinho.Next;
  end;

  EdTotal.Text := CurrToStr(Total);
end;

procedure TFCarrinho.CarregaProdutos;
begin
  TbGrid.EmptyDataSet;
  TbGrid.Open;
  TBProdutos.First;
  while not TBProdutos.Eof do
  begin
    if TBProdutos.FieldByName('custo').AsCurrency > 0 then
    begin
      TbGrid.Append;
      TbGrid['S'] := False;
      TbGrid['id'] := TBProdutos['id'];
      TbGrid['Nome'] := TBProdutos['Nome'];
      TbGrid['Margem'] := TBProdutos['Margem'];
      TbGrid['Descricao'] := TBProdutos['Descricao'];
      TbGrid['custo'] := TBProdutos['custo'];
      TbGrid.Post;
    end;
    TBProdutos.Next;
  end;
  TbGrid.First;
end;

procedure TFCarrinho.GridCarrinhoColEnter(Sender: TObject);
begin
  if GridCarrinho.SelectedField.FieldName = 'Quantidade' then
    CalculaPrecoItens;
end;

procedure TFCarrinho.GridCarrinhoColExit(Sender: TObject);
begin
  if GridCarrinho.SelectedField.FieldName = 'Quantidade' then
    CalculaPrecoItens;
end;

procedure TFCarrinho.GridCarrinhoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName <> 'Quantidade' then
  begin
    GridCarrinho.Canvas.Brush.Color := clGray;
    GridCarrinho.DefaultDrawDataCell(Rect, GridCarrinho.columns[DataCol].field, State);
  end;
end;

procedure TFCarrinho.GridCarrinhoKeyPress(Sender: TObject; var Key: Char);
begin
  if GridCarrinho.SelectedField.FieldName = 'Quantidade' then
    CalculaPrecoItens;
end;

procedure TFCarrinho.GridProdutosCellClick(Column: TColumn);
begin
  TbGrid.Edit;
  if TbGridS.AsBoolean = True then
    TbGridS.AsBoolean := False
  else
    TbGridS.AsBoolean := True;
  TbGrid.Post;
  if Column.FieldName = 'S' then
  begin
    GridProdutos.SelectedIndex := 1;
    GridProdutos.SetFocus;
    GridProdutos.SelectedIndex := 0;
    GridProdutos.SetFocus;
  end;
end;

procedure TFCarrinho.GridProdutosDblClick(Sender: TObject);
begin
  if GridProdutos.SelectedIndex = 0 then
  begin
    GridProdutos.SelectedIndex := 1;
    GridProdutos.SetFocus;
    GridProdutos.SelectedIndex := 0;
    GridProdutos.SetFocus;
  end;
end;

procedure TFCarrinho.GridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'S' then
  begin
    GridProdutos.Canvas.FillRect(Rect);
    Check := 0;
    if TbGridS.AsBoolean then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, -2, -2);

    DrawFrameControl(GridProdutos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFCarrinho.EdValorExit(Sender: TObject);
begin
  (Sender as TEdit).Text := FormatCurr('#,.##', StrToCurrDef((Sender as TEdit).Text, 0));
  if (Sender as TEdit).Name = 'EdValor' then
  begin
    if StrToCurrDef((Sender as TEdit).Text, 0) <= 0 then
    begin
      MessageDlg('O valor informado deve ser maior que 0 (Zero)', mtCustom, [mbOK], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
    CalculaPrecoItens;
  end;
end;

procedure TFCarrinho.EdValorKeyPress(Sender: TObject; var Key: Char);

  function Valida_Numero: Char;
  begin
    if (not(Key in ['0' .. '9', Chr(8)])) and (Key <> '.') and (Key <> ',') then
      Key := #0;
    Result := Key;
  end;

begin
  Key := Valida_Numero;
end;

procedure TFCarrinho.FormCreate(Sender: TObject);
var
  DBName: String;
begin
  ID := 0;
  DBName := ExtractFilePath(Application.ExeName) + 'DBVendas.sqlite';
  // DeleteFile(DBName);
  if not(FileExists(DBName)) then
  begin
    FDConexao.Params.Values['database'] := DBName;
    FDConexao.Connected := True;

    TBProdutos.TableName := 'Produtos';
    TBProdutos.CreateTable(False, [tpTable]);
    TBProdutos.Open();
    TBProdutos.InsertRecord([1, 'Batata', 'Batata-inglesa, batatinha, pataca, escorva, papa ou semilha.', 2, 50]);
    TBProdutos.InsertRecord([2, 'Feij�o', 'Nome comum para da fam�lia Fabaceae.', 3, 75]);
    TBProdutos.InsertRecord([3, 'Arroz', ' Planta que alimenta mais da metade da popula��o humana do mundo.', 4, 100]);

    TbCarrinho.TableName := 'Carrinho';
    TbCarrinho.CreateTable(False, [tpTable]);

    TbCarrinhoProdutos.TableName := 'CarrinhoProdutos';
    TbCarrinhoProdutos.CreateTable(False, [tpTable]);
    FDConexao.Commit;
  end
  else
  begin
    FDConexao.Params.Values['database'] := DBName;
    FDConexao.Connected := True;
    TBProdutos.Open();
  end;

  TbCarrinhoProdutos.Open();
  TbCarrinho.Open();

  CarregaProdutos;

  PgControl.TabIndex := 0;
end;

end.
