unit PostoABC.Controller.Contract;

interface

uses
  PostoABC.Model.DAO.Contract,
  PostoABC.Model.Entities.Abastecimento,
  PostoABC.Model.Entities.Bomba,
  PostoABC.Model.Entities.Tanque;

type
  IController = interface
    ['{EDE899F8-5600-4527-B1BC-0DDF51FAFF27}']
    function Abastecimentos : IModelDAOEntity<TAbastecimento>;
    function Bombas         : IModelDAOEntity<TBomba>;
    function Tanques        : IModelDAOEntity<TTanque>;
  end;

implementation

end.
