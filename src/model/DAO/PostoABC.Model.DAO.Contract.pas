unit PostoABC.Model.DAO.Contract;

interface

uses
  Data.DB;

type
  IModelDAOEntity<T> = interface
    ['{6EAE503E-0B36-4819-9896-3B05E22AA7C2}']
    function DataSet(AValue : TDataSource)       : IModelDAOEntity<T>;
    function GetReport(ADataIni,ADataFim: TDate) : IModelDAOEntity<T>;
    function Get                                 : IModelDAOEntity<T>;
    function Insert                              : IModelDAOEntity<T>;
    function Update                              : IModelDAOEntity<T>;
    function Delete                              : IModelDAOEntity<T>;
    function This                                : T;
  end;

implementation

end.
