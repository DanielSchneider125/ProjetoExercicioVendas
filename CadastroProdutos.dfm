object FProdutos: TFProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro Produtos'
  ClientHeight = 216
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnFundo: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 216
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 160
    object LbID: TLabel
      Left = 43
      Top = 16
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = EdID
    end
    object LbNome: TLabel
      Left = 27
      Top = 40
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = EdNome
    end
    object LbDescricao: TLabel
      Left = 8
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Descricao'
    end
    object LbCusto: TLabel
      Left = 26
      Top = 128
      Width = 28
      Height = 13
      Caption = 'Custo'
      FocusControl = EdCusto
    end
    object LbMargem: TLabel
      Left = 536
      Top = 128
      Width = 38
      Height = 13
      Caption = 'Margem'
      FocusControl = EdMargem
    end
    object EdID: TDBEdit
      Left = 60
      Top = 13
      Width = 134
      Height = 21
      DataField = 'ID'
      DataSource = DSProdutos
      TabOrder = 0
    end
    object EdNome: TDBEdit
      Left = 60
      Top = 40
      Width = 654
      Height = 21
      DataField = 'Nome'
      DataSource = DSProdutos
      TabOrder = 1
    end
    object EdCusto: TDBEdit
      Left = 60
      Top = 127
      Width = 134
      Height = 21
      DataField = 'Custo'
      DataSource = DSProdutos
      TabOrder = 3
    end
    object EdMargem: TDBEdit
      Left = 580
      Top = 127
      Width = 134
      Height = 21
      DataField = 'Margem'
      DataSource = DSProdutos
      TabOrder = 4
    end
    object MnDescricao: TDBMemo
      Left = 60
      Top = 67
      Width = 654
      Height = 54
      DataField = 'Descricao'
      DataSource = DSProdutos
      TabOrder = 2
    end
    object PnButtons: TPanel
      Left = 1
      Top = 168
      Width = 719
      Height = 47
      Align = alBottom
      TabOrder = 5
      object BtGravar: TButton
        Left = 280
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 0
        OnClick = BtGravarClick
      end
      object BtCancelar: TButton
        Left = 376
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = BtCancelarClick
      end
    end
  end
  object TBProdutos: TFDTable
    Left = 347
    Top = 13
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
    object TBProdutosMargem: TFloatField
      FieldName = 'Margem'
    end
  end
  object DSProdutos: TDataSource
    DataSet = TBProdutos
    Left = 344
    Top = 56
  end
end
