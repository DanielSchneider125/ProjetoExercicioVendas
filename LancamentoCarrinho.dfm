object FCarrinho: TFCarrinho
  Left = 0
  Top = 0
  Caption = 'Carrinho'
  ClientHeight = 374
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 374
    Align = alClient
    TabOrder = 0
    object PgControl: TPageControl
      Left = 1
      Top = 1
      Width = 730
      Height = 372
      ActivePage = TsProdutos
      Align = alClient
      TabOrder = 0
      object TsProdutos: TTabSheet
        Caption = 'Produtos'
        object PnProdutos: TPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 303
          Align = alClient
          TabOrder = 0
          object GridProdutos: TDBGrid
            Left = 1
            Top = 1
            Width = 720
            Height = 301
            Align = alClient
            DataSource = DSProdutos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GridProdutosCellClick
            OnDrawColumnCell = GridProdutosDrawColumnCell
            OnDblClick = GridProdutosDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'S'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                ReadOnly = True
                Visible = True
              end>
          end
        end
        object PnProdutosBottom: TPanel
          Left = 0
          Top = 303
          Width = 722
          Height = 41
          Align = alBottom
          TabOrder = 1
          object BtCarrinho: TButton
            Left = 600
            Top = 5
            Width = 113
            Height = 32
            Caption = 'Visualizar Carrinho'
            TabOrder = 3
            OnClick = BtCarrinhoClick
          end
          object BtAddCarrinho: TButton
            Left = 481
            Top = 5
            Width = 113
            Height = 32
            Caption = 'Adicionar ao Carrinho'
            TabOrder = 2
            OnClick = BtAddCarrinhoClick
          end
          object BtAddProduto: TButton
            Left = 1
            Top = 6
            Width = 113
            Height = 32
            Caption = 'Adicionar Produto'
            TabOrder = 0
            OnClick = BtAddProdutoClick
          end
          object BtEditarProduto: TButton
            Left = 120
            Top = 6
            Width = 113
            Height = 32
            Caption = 'Editar Produto'
            TabOrder = 1
            OnClick = BtEditarProdutoClick
          end
        end
      end
      object Carrinho: TTabSheet
        Caption = 'Carrinho'
        ImageIndex = 1
        object PnFundoCarrinho: TPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 344
          Align = alClient
          TabOrder = 0
          object GridCarrinho: TDBGrid
            Left = 1
            Top = 42
            Width = 720
            Height = 260
            Align = alClient
            DataSource = DSProdutosCarrinho
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColExit = GridCarrinhoColExit
            OnDrawColumnCell = GridCarrinhoDrawColumnCell
            OnExit = GridCarrinhoExit
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Preco'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Total'
                Visible = True
              end>
          end
          object PnTopCarrinho: TPanel
            Left = 1
            Top = 1
            Width = 720
            Height = 41
            Align = alTop
            TabOrder = 1
            object LbTotal: TLabel
              Left = 552
              Top = 14
              Width = 24
              Height = 13
              Caption = 'Total'
            end
            object LbDespesas: TLabel
              Left = 16
              Top = 14
              Width = 46
              Height = 13
              Caption = 'Despesas'
            end
            object EdValor: TEdit
              Left = 66
              Top = 10
              Width = 79
              Height = 21
              Alignment = taRightJustify
              TabOrder = 0
              Text = '400,00'
              OnExit = EdValorExit
              OnKeyPress = EdValorKeyPress
            end
            object EdTotal: TEdit
              Left = 592
              Top = 10
              Width = 121
              Height = 21
              Alignment = taRightJustify
              ReadOnly = True
              TabOrder = 1
              Text = '0,00'
              OnExit = EdValorExit
              OnKeyPress = EdValorKeyPress
            end
          end
          object PnBottomCarrinho: TPanel
            Left = 1
            Top = 302
            Width = 720
            Height = 41
            Align = alBottom
            TabOrder = 2
            object BtSalvar: TButton
              Left = 638
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Salvar'
              TabOrder = 3
              OnClick = BtSalvarClick
            end
            object BtCarregar: TButton
              Left = 536
              Top = 6
              Width = 96
              Height = 25
              Caption = 'Carregar Carrinho'
              TabOrder = 2
              OnClick = BtCarregarClick
            end
            object BtLimpar: TButton
              Left = 455
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Limpar'
              TabOrder = 1
              OnClick = BtLimparClick
            end
            object BtVoltar: TButton
              Left = 16
              Top = 6
              Width = 113
              Height = 25
              Caption = 'Voltar aos Produtos'
              TabOrder = 0
              OnClick = BtVoltarClick
            end
          end
        end
      end
    end
  end
  object FDConexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 352
    Top = 104
  end
  object TBProdutos: TFDTable
    Connection = FDConexao
    UpdateOptions.UpdateTableName = 'Produtos'
    TableName = 'Produtos'
    Left = 632
    Top = 280
    object TBProdutosID: TIntegerField
      FieldName = 'ID'
    end
    object TBProdutosNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TBProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object TBProdutosCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object TBProdutosMargem: TCurrencyField
      FieldName = 'Margem'
    end
  end
  object DSProdutos: TDataSource
    DataSet = TbGrid
    Left = 376
    Top = 16
  end
  object TbGrid: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Custo'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'Margem'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'S'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 144
    Top = 128
    object TbGridID: TIntegerField
      FieldName = 'ID'
    end
    object TbGridNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TbGridDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object TbGridCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object TbGridMargem: TCurrencyField
      FieldName = 'Margem'
    end
    object TbGridS: TBooleanField
      FieldName = 'S'
    end
  end
  object TbGridCarrinho: TFDMemTable
    Active = True
    AfterScroll = TbGridCarrinhoAfterScroll
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Preco'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'Custo'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'Margem'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'Total'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'Quantidade'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 144
    Top = 176
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object TbGridCarrinhoPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object TbGridCarrinhoCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object TbGridCarrinhoMargem: TCurrencyField
      FieldName = 'Margem'
    end
    object TbGridCarrinhoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TbGridCarrinhoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
  end
  object DSProdutosCarrinho: TDataSource
    DataSet = TbGridCarrinho
    Left = 509
    Top = 121
  end
  object TbCarrinhoProdutos: TFDTable
    Connection = FDConexao
    UpdateOptions.UpdateTableName = 'CarrinhoProdutos'
    TableName = 'CarrinhoProdutos'
    Left = 632
    Top = 232
    object IntegerField2: TIntegerField
      FieldName = 'ID'
    end
    object TbCarrinhoProdutosIdProduto: TIntegerField
      FieldName = 'IdProduto'
    end
    object TbCarrinhoProdutosIdVenda: TIntegerField
      FieldName = 'IdVenda'
    end
    object TbCarrinhoProdutosQuantidade: TCurrencyField
      FieldName = 'Quantidade'
    end
    object TbCarrinhoProdutosPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object TbCarrinhoProdutosCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object TbCarrinhoProdutosMargem: TFloatField
      FieldName = 'Margem'
    end
    object TbCarrinhoProdutosNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = TBProdutos
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'IdProduto'
      Size = 50
      Lookup = True
    end
  end
  object TbCarrinho: TFDTable
    Connection = FDConexao
    UpdateOptions.UpdateTableName = 'Carrinho'
    TableName = 'Carrinho'
    Left = 632
    Top = 184
    object IntegerField3: TIntegerField
      FieldName = 'ID'
    end
    object TbCarrinhoDespesas: TCurrencyField
      FieldName = 'Despesas'
    end
    object TbCarrinhoTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
end
