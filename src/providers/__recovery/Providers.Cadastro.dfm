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
      'select id, nome, valor, status, estoque::INTEGER from produto')
    Left = 32
    Top = 96
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
