unit PostoABC.Model.DAO.Tanque;

interface

uses
  PostoABC.Model.DAO.Contract,
  PostoABC.Model.Entities.Tanque, Data.DB,
  PostoABC.Model.Components.Connection.Contract,
  StrUtils;

type
    TModelDAOTanque = class(TInterfacedObject, IModelDAOEntity<TTanque>)
      private
        FConnection : IModelComponentsConnection;
        FDataSet    : TDataSource;
        FEntity     : TTanque;
      public
        constructor Create;
        destructor Destroy; override;
        class function New : IModelDAOEntity<TTanque>;
        function Delete                               : IModelDAOEntity<TTanque>;
        function DataSet(AValue : TDataSource)        : IModelDAOEntity<TTanque>;
        function GetReport(ADataIni, ADataFim: TDate) : IModelDAOEntity<TTanque>;
        function Get                                  : IModelDAOEntity<TTanque>;
        function Insert                               : IModelDAOEntity<TTanque>;
        function Update                               : IModelDAOEntity<TTanque>;
        function This                                 : TTanque;
    end;

implementation

uses
  System.SysUtils, PostoABC.Model.Components.Connection.FireDAC;

{ TModelDAOTanque }

constructor TModelDAOTanque.Create;
begin
  FConnection := TModelComponentsConnectionFireDAC.New;
  FEntity     := TTanque.Create;
end;

function TModelDAOTanque.DataSet(AValue: TDataSource): IModelDAOEntity<TTanque>;
begin
  Result := Self;
  FDataSet := AValue;
  FDataSet.DataSet := Self.FConnection.DataSet;
end;

function TModelDAOTanque.Delete: IModelDAOEntity<TTanque>;
begin
Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('DELETE FROM TANQUES WHERE ID = :ID_TANQUE')
      .ParamName('ID_TANQUE' ,Self.FEntity.IdTanque)
      .ExecSQL;
  except
    on e:exception do
    begin
      if ContainsText(e.Message, 'FOREIGN KEY constraint failed') then
        raise Exception.Create('O registro possui relacionamento com outro dado, operação cancelada.')
      else
        raise Exception.Create('Error ao deletar o tanque: ' + e.Message);
    end;
  end;
end;

destructor TModelDAOTanque.Destroy;
begin
  Self.FEntity.Free;
  inherited;
end;

function TModelDAOTanque.Get: IModelDAOEntity<TTanque>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('SELECT * FROM TANQUES')
      .Open;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao inserir o tanque: ' + e.Message);
    end;
  end;
end;

function TModelDAOTanque.GetReport(ADataIni, ADataFim: TDate): IModelDAOEntity<TTanque>;
begin

end;

function TModelDAOTanque.Insert: IModelDAOEntity<TTanque>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('INSERT INTO TANQUES(DESCRICAO, VALOR_LITRO)')
      .SQL(' VALUES (:DESCRICAO, :VALOR_LITRO)')
      .ParamName('DESCRICAO', Self.FEntity.Descricao)
      .ParamName('VALOR_LITRO', Self.FEntity.ValorLitro)
      .ExecSQL;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao inserir o abastecimento: ' + e.Message);
    end;
  end;
end;

class function TModelDAOTanque.New: IModelDAOEntity<TTanque>;
begin
    Result := Self.Create;
end;

function TModelDAOTanque.This: TTanque;
begin
  Result := FEntity;
end;

function TModelDAOTanque.Update: IModelDAOEntity<TTanque>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('UPDATE TANQUES SET DESCRICAO = :DESCRICAO,')
      .SQL(' VALOR_LITRO = :VALOR_LITRO')
      .SQL(' WHERE ID = :ID_TANQUE')
      .ParamName('DESCRICAO', Self.FEntity.Descricao)
      .ParamName('VALOR_LITRO', Self.FEntity.ValorLitro)
      .ParamName('ID_TANQUE', Self.FEntity.IdTanque)
      .ExecSQL;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao atualizar o tanque: ' + e.Message);
    end;
  end;
end;

end.
