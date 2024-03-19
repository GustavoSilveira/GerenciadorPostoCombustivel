unit PostoABC.Model.DAO.Abastecimento;
interface
uses
  Data.DB,
  PostoABC.Model.Entities.Abastecimento,
  PostoABC.Model.DAO.Contract,
  PostoABC.Model.Components.Connection.Contract;
type
  TModelDAOAbastecimento = class(TInterfacedObject, IModelDAOEntity<TAbastecimento>)
    private
      FConnection : IModelComponentsConnection;
      FDataSet    : TDataSource;
      FEntity     : TAbastecimento;
    public
      constructor Create;
      destructor Destroy; override;
      class function New                            : IModelDAOEntity<TAbastecimento>;
      function Delete                               : IModelDAOEntity<TAbastecimento>;
      function DataSet(AValue : TDataSource)        : IModelDAOEntity<TAbastecimento>;
      function GetReport(ADataIni, ADataFim: TDate) : IModelDAOEntity<TAbastecimento>;
      function Get                                  : IModelDAOEntity<TAbastecimento>;
      function Insert                               : IModelDAOEntity<TAbastecimento>;
      function Update                               : IModelDAOEntity<TAbastecimento>;
      function This                                 : TAbastecimento;
  end;
implementation
uses
  System.SysUtils,
  PostoABC.Model.Components.Connection.FireDAC;
{ TModelDAOAbastecimento }
constructor TModelDAOAbastecimento.Create;
begin
  FConnection := TModelComponentsConnectionFireDAC.New;
  FEntity := TAbastecimento.Create;
end;
function TModelDAOAbastecimento.DataSet(AValue: TDataSource): IModelDAOEntity<TAbastecimento>;
begin
  Result := Self;
  FDataSet := AValue;
  FDataSet.DataSet := Self.FConnection.DataSet;
end;
function TModelDAOAbastecimento.Delete: IModelDAOEntity<TAbastecimento>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('DELETE FROM ABASTECIMENTOS WHERE ID = :ID_ABASTECIMENTO')
      .ParamName('ID_ABASTECIMENTO' ,Self.FEntity.IdAbastecimento)
      .ExecSQL;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao deletar o abastecimento: ' + e.Message);
    end;
  end;
end;
destructor TModelDAOAbastecimento.Destroy;
begin
    Self.FEntity.Free;
  inherited;
end;

function TModelDAOAbastecimento.Get: IModelDAOEntity<TAbastecimento>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('SELECT')
      .SQL('  A.ID,')
      .SQL('	STRFTIME(''%d/%m/%Y, %H:%M:%S'', A.DATA_ABASTECIMENTO) AS DATA_ABASTECIMENTO,')
      .SQL('  T.DESCRICAO AS DESCRICAO_TANQUE,')
      .SQL('  B.NUMERO_BOMBA AS DESCRICAO_BOMBA,')
      .SQL('  A.VALOR_LITRO AS VALOR_LITRO ,')
      .SQL('  A.QUANTIDADE_LITROS,')
      .SQL('  A.VALOR_IMPOSTO AS VALOR_IMPOSTO,')
      .SQL('  A.VALOR_ABASTECIDO AS VALOR_ABASTECIMENTO')
      .SQL('FROM')
      .SQL('	ABASTECIMENTOS A')
      .SQL('JOIN BOMBAS B ON A.ID_BOMBA = B.ID')
      .SQL('JOIN TANQUES T ON B.ID_TANQUE = T.ID')
      .SQL('ORDER BY A.DATA_ABASTECIMENTO DESC')
      .Open;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao pesquisar abastecimentos: ' + e.Message);
    end;
  end;
end;

function TModelDAOAbastecimento.GetReport(ADataIni, ADataFim: TDate): IModelDAOEntity<TAbastecimento>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('SELECT')
      .SQL('	DATE(A.DATA_ABASTECIMENTO) AS DATA_ABASTECIMENTO,')
      .SQL('  T.DESCRICAO AS DESCRICAO_TANQUE,')
      .SQL('  B.NUMERO_BOMBA AS DESCRICAO_BOMBA,')
      .SQL('  SUM(A.QUANTIDADE_LITROS) AS QUANTIDADE_LITROS,')
      .SQL('  SUM(A.VALOR_IMPOSTO) AS VALOR_IMPOSTO,')
      .SQL('  SUM(A.VALOR_ABASTECIDO) AS VALOR_TOTAL')
      .SQL('FROM')
      .SQL('	ABASTECIMENTOS A')
      .SQL('JOIN BOMBAS B ON A.ID_BOMBA = B.ID')
      .SQL('JOIN TANQUES T ON B.ID_TANQUE = T.ID')
      //.SQL('WHERE DATE(A.DATA_ABASTECIMENTO) BETWEEN :DATA_INICIO AND :DATA_FIM')
      .SQL('GROUP BY DATE(A.DATA_ABASTECIMENTO), T.DESCRICAO, B.NUMERO_BOMBA')
      .SQL('ORDER BY DATE(A.DATA_ABASTECIMENTO), T.DESCRICAO, B.NUMERO_BOMBA')
      //.ParamName('DATA_INICIO', ADataIni)
      //.ParamName('DATA_FIM',  ADataFim)
      .Open;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao pesquisar abastecimentos: ' + e.Message);
    end;
  end;
end;
function TModelDAOAbastecimento.Insert: IModelDAOEntity<TAbastecimento>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('INSERT INTO ABASTECIMENTOS(DATA_ABASTECIMENTO,')
      .SQL(' VALOR_LITRO, QUANTIDADE_LITROS, VALOR_IMPOSTO, VALOR_ABASTECIDO, ID_BOMBA)')
      .SQL(' VALUES (:DATA_ABASTECIMENTO, :VALOR_LITRO, :QUANTIDADE_LITROS,')
      .SQL(' :VALOR_IMPOSTO, :VALOR_ABASTECIDO, :ID_BOMBA)')
      .ParamName('DATA_ABASTECIMENTO',  Self.FEntity.DataAbastecimento)
      .ParamName('VALOR_LITRO',         Self.FEntity.ValorPorLitro)
      .ParamName('QUANTIDADE_LITROS',   Self.FEntity.QuantidadeLitros)
      .ParamName('VALOR_IMPOSTO',       Self.FEntity.Imposto)
      .ParamName('VALOR_ABASTECIDO',    Self.FEntity.ValorAbastecimento)
      .ParamName('ID_BOMBA',            Self.FEntity.IdBomba)
      .ExecSQL;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao inserir o abastecimento: ' + e.Message);
    end;
  end;
end;
class function TModelDAOAbastecimento.New: IModelDAOEntity<TAbastecimento>;
begin
  Result := Self.Create;
end;
function TModelDAOAbastecimento.This: TAbastecimento;
begin
  Result := Self.FEntity;
end;
function TModelDAOAbastecimento.Update: IModelDAOEntity<TAbastecimento>;
begin
  Result := Self;
  try
    Self.FConnection
      .Active(false)
      .ClearSQL
      .SQL('UPDATE ABASTECIMENTO SET DATA_ABASTECIMENTO = :DATA_ABASTECIMENTO,')
      .SQL(' VALOR_LITRO = :VALOR_LITRO, QUANTIDADE_LITROS = :QUANTIDADE_LITROS,')
      .SQL(' VALOR_IMPOSTO = :IMPOSTO, VALOR_ABASTECIDO = :VALOR_ABASTECIDO')
      .SQL(' WHERE ID = :ID_ABASTECIMENTO)')
      .ParamName('DATA_ABASTECIMENTO', Self.FEntity.DataAbastecimento)
      .ParamName('VALOR_LITRO', Self.FEntity.ValorPorLitro)
      .ParamName('QUANTIDADE_LITROS', Self.FEntity.QuantidadeLitros)
      .ParamName('VALOR_IMPOSTO', Self.FEntity.QuantidadeLitros)
      .ParamName('VALOR_ABASTECIDO', Self.FEntity.ValorAbastecimento)
      .ParamName('ID_ABASTECIMENTO', Self.FEntity.IdAbastecimento)
      .ExecSQL;
  except
    on e:exception do
    begin
      raise Exception.Create('Error ao atualizar o abastecimento: ' + e.Message);
    end;
  end;
end;
end.
