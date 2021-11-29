unit Controllers.Cliente;

interface

procedure Registry;

implementation

uses Horse, Services.Cliente, System.JSON, DataSet.Serialize, Data.DB;

procedure ListarClientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LRetorno: TJSONObject;
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create;
  try
    LRetorno := TJSONObject.Create;
    LRetorno.AddPair('data', LService.ListAll(Req.Query).ToJSONArray());
    LRetorno.AddPair('records', TJSONNumber.Create(LService.GetRecordCount));
    Res.Send(LRetorno);
  finally
    LService.Free;
  end;
end;

procedure ObterCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdCliente: string;
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create;
  try
    LIdCliente := Req.Params['id'];
    if LService.GetById(LIdCliente).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Cliente n�o cadastrado');
    Res.Send(LService.qryCadastro.ToJSONObject());
  finally
    LService.Free;
  end;
end;

procedure CadastrarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LCliente: TJSONObject;
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create;
  try
    LCliente := Req.Body<TJSONObject>;
    if LService.Append(LCliente) then
      Res.Send(LService.qryCadastro.ToJSONObject()).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;
end;

procedure AlterarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdCliente: string;
  LService: TServiceCliente;
  LCliente: TJSONObject;
begin
  LService := TServiceCliente.Create;
  try
    LIdCliente := Req.Params['id'];
    if LService.GetById(LIdCliente).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Cliente n�o cadastrado');
    LCliente := Req.Body<TJSONObject>;
    if LService.Update(LCliente) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure DeletarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LIdCliente: string;
  LService: TServiceCliente;
begin
  LService := TServiceCliente.Create;
  try
    LIdCliente := Req.Params['id'];
    if LService.GetById(LIdCliente).IsEmpty then
      raise EHorseException.Create(THTTPStatus.NotFound, 'Cliente n�o cadastrado');
    if LService.Delete then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/clientes', ListarClientes);
  THorse.Get('/clientes/:id', ObterCliente);
  THorse.Post('/clientes', CadastrarCliente);
  THorse.Put('/clientes/:id', AlterarCliente);
  THorse.Delete('/clientes/:id', DeletarCliente);
end;

end.
