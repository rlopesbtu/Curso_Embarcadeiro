inherited ServiceProduto: TServiceProduto
  inherited FDConnection: TFDConnection
    FormatOptions.AssignedValues = [fvDataSnapCompatibility]
    FormatOptions.DataSnapCompatibility = True
  end
  inherited qryPesquisa: TFDQuery
    SQL.Strings = (
      'select p.id, '
      '       p.nome,'
      '       p.valor, '
      '       p.status, '
      '       p.estoque'
      '  from produto p'
      ' where 1 = 1')
    object qryPesquisaid: TLargeintField
      FieldName = 'id'
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
      Precision = 32
      Size = 0
    end
    object qryPesquisastatus: TSmallintField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryPesquisaestoque: TLargeintField
      FieldName = 'estoque'
      Origin = 'estoque'
    end
  end
  inherited qryRecordCount: TFDQuery
    SQL.Strings = (
      'select count(p.id)'
      '  from produto p'
      ' where 1 = 1')
  end
  inherited qryCadastro: TFDQuery
    SQL.Strings = (
      'select p.id, p.nome, p.valor, p.status, p.estoque'
      '  from produto p')
    object qryCadastroid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCadastronome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object qryCadastrovalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 32
      Size = 0
    end
    object qryCadastrostatus: TSmallintField
      FieldName = 'status'
      Origin = 'status'
    end
    object qryCadastroestoque: TLargeintField
      FieldName = 'estoque'
      Origin = 'estoque'
    end
  end
end
