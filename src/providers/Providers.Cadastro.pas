unit Providers.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Providers.Connection, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.JSON, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.Generics.Collections,
  FireDAC.VCLUI.Wait;

type
  TProvidersCadastro = class(TProvidersConnection)
    qryPesquisa: TFDQuery;
    qryRecordCount: TFDQuery;
    qryCadastro: TFDQuery;
    qryRecordCountCOUNT: TLargeintField;
    qryPesquisaid: TLargeintField;
    qryPesquisanome: TWideStringField;
    qryPesquisavalor: TFMTBCDField;
    qryPesquisastatus: TSmallintField;
    qryPesquisaestoque: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create; reintroduce;
    function Append(const AJson: TJSONObject) : Boolean; virtual;
    function Update(const AJson: TJSONObject): Boolean; virtual;
    function Delete: Boolean; virtual;
    function ListAll(const AParams: TDictionary<string,string>): TFDQuery; virtual;
    function GetById(const AId: string):TFDQuery; virtual;
    function GetRecordCount: Int64; virtual;
  end;

var
  ProvidersCadastro: TProvidersCadastro;

implementation
  uses DataSet.Serialize;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TProvidersCadastro }

function TProvidersCadastro.Append(const AJson: TJSONObject): Boolean;
begin
    qryCadastro.SQL.Add('where 1<>1');
    qryCadastro.Open();
    qryCadastro.LoadFromJSON(AJson, False); //Nao quero que o dataset serialize destrua esse Jason, por isso false.
    result := qryCadastro.ApplyUpdates(0) = 0;   // se for zero retorna true
end;

constructor TProvidersCadastro.Create;
begin
 inherited Create(nil);
end;

function TProvidersCadastro.Delete: Boolean;
begin
   qryCadastro.Delete;
   Result := qryCadastro.ApplyUpdates(0) = 0;
end;

function TProvidersCadastro.GetById(const AId: string): TFDQuery;
begin
  qryCadastro.SQL.Add('where id = :id');
  qryCadastro.ParamByName('id').AsLargeInt := AId.ToInt64;
  qryCadastro.Open();
  Result := qryCadastro;
end;

function TProvidersCadastro.GetRecordCount: Int64;
begin
   qryRecordCount.Open();
  Result := qryRecordCountCOUNT.AsLargeInt;
end;

function TProvidersCadastro.ListAll(const AParams: TDictionary<string, string>): TFDQuery;
begin
  if AParams.ContainsKey('limit') then
  begin
    qryPesquisa.FetchOptions.RecsMax := StrToIntDef(AParams.Items['limit'], 50);
    qryPesquisa.FetchOptions.RowsetSize := StrToIntDef(AParams.Items['limit'], 50);
  end;
  if AParams.ContainsKey('offset') then
    qryPesquisa.FetchOptions.RecsSkip := StrToIntDef(AParams.Items['offset'], 0);
  qryPesquisa.Open();
  Result := qryPesquisa;
end;

function TProvidersCadastro.Update(const AJson: TJSONObject): Boolean;
begin
  qryCadastro.MergeFromJSONObject(AJson, False);
  Result := qryCadastro.ApplyUpdates(0) = 0;
end;


end.
