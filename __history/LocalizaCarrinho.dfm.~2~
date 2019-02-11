object FLocalizaCarrinho: TFLocalizaCarrinho
  Left = 0
  Top = 0
  Caption = 'Localiza Carrinho'
  ClientHeight = 351
  ClientWidth = 447
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
    Width = 447
    Height = 351
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 72
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 445
      Height = 349
      Align = alClient
      DataSource = DS
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Despesas'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Visible = True
        end>
    end
  end
  object TbCarrinho: TFDTable
    UpdateOptions.UpdateTableName = 'Carrinho'
    TableName = 'Carrinho'
    Left = 371
    Top = 117
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
  object DS: TDataSource
    DataSet = TbCarrinho
    Left = 368
    Top = 64
  end
end
