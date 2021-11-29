inherited ProvidersCadastro: TProvidersCadastro
  OldCreateOrder = True
  Width = 554
  inherited FDConnection: TFDConnection
    Connected = True
  end
  object qryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 424
    Top = 48
    object qryPesquisaid: TLargeintField
      FieldName = 'id'
      KeyFields = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object qryPesquisavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 64
      Size = 0
    end
    object qryPesquisastatus: TSmallintField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryPesquisaestoque: TLargeintField
      FieldName = 'estoque'
      Origin = 'estoque'
      EditFormat = 'integer'
    end
  end
  object qryRecordCount: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 320
    Top = 48
    object qryRecordCountCOUNT: TLargeintField
      FieldName = 'COUNT'
    end
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 200
    Top = 48
  end
end
