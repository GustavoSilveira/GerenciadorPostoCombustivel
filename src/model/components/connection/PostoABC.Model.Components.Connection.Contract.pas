unit PostoABC.Model.Components.Connection.Contract;

interface

uses
  Data.DB;

type
  IModelComponentsConnection = interface
    ['{B813E4AA-6027-4B7C-85B4-85DCEF80BCE1}']
    function Active(AValue : Boolean)                         : IModelComponentsConnection;
    function ClearSQL                                         : IModelComponentsConnection;
    function DataSet                                          : TDataSet;
    function ExecSQL                                          : IModelComponentsConnection;
    function ParamName(AParamName : string; AValue : string)  : IModelComponentsConnection; overload;
    function ParamName(AParamName : string; AValue : integer) : IModelComponentsConnection; overload;
    function ParamName(AParamName : string; AValue : variant) : IModelComponentsConnection; overload;
    function SQL(AVAlue : string)                             : IModelComponentsConnection;
    function Open                                             : IModelComponentsConnection;
  end;

implementation

end.
