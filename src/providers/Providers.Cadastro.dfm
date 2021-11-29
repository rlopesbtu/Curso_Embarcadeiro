inherited ProvidersCadastro: TProvidersCadastro
  OldCreateOrder = True
  Height = 194
  Width = 346
  inherited FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 152
    Top = 16
  end
  object qryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    SQL.Strings = (
      'select id, nome, valor, status, estoque from produto')
    Left = 32
    Top = 96
    object qryPesquisaid: TLargeintField
      FieldName = 'id'
      KeyFields = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object qryPesquisavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 20
      Size = 4
    end
    object qryPesquisastatus: TSmallintField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryPesquisaestoque: TFMTBCDField
      FieldName = 'estoque'
      Origin = 'estoque'
      EditFormat = 'integer'
      Precision = 20
      Size = 4
    end
  end
  object qryRecordCount: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 128
    Top = 96
    object qryRecordCountCOUNT: TLargeintField
      FieldName = 'COUNT'
    end
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 216
    Top = 96
  end
end
