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
  end
end
