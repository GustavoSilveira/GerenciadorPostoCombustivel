unit PostoABC.Controller;

interface

uses
  PostoABC.Controller.Contract,
  PostoABC.Model.DAO.Contract,
  PostoABC.Model.Entities.Abastecimento,
  PostoABC.Model.Entities.Bomba,
  PostoABC.Model.Entities.Tanque;

type
    TController = class(TInterfacedObject, IController)
      private
        FModelAbastecimento : IModelDAOEntity<TAbastecimento>;
        FModelBomba         : IModelDAOEntity<TBomba>;
        FModelTanque        : IModelDAOEntity<TTanque>;
      public
        constructor Create;
        destructor Destroy; override;
        class function New : IController;
        function Abastecimentos : IModelDAOEntity<TAbastecimento>;
        function Bombas         : IModelDAOEntity<TBomba>;
        function Tanques        : IModelDAOEntity<TTanque>;
    end;

implementation

uses
  PostoABC.Model.DAO.Abastecimento, PostoABC.Model.DAO.Bomba,
  PostoABC.Model.DAO.Tanque;

{ TController }

function TController.Abastecimentos: IModelDAOEntity<TAbastecimento>;
begin
  if not Assigned(FModelAbastecimento) then
    FModelAbastecimento := TModelDAOAbastecimento.New;

  Result := FModelAbastecimento;
end;

function TController.Bombas: IModelDAOEntity<TBomba>;
begin
  if not Assigned(FModelBomba) then
    FModelBomba := TModelDAoBomba.New;

  Result := FModelBomba;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: IController;
begin
    Result := Self.Create;
end;

function TController.Tanques: IModelDAOEntity<TTanque>;
begin
  if not Assigned(FModelTanque) then
    FModelTanque := TModelDAOTanque.New;

  Result := FModelTanque;
end;

end.
