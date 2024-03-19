unit PostoABC.Model.Components.Connection.FireDAC;

interface

uses
  PostoABC.Model.Components.Connection.Contract,

  Data.DB,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite,
  FireDAC.Comp.Client, FireDAC.DApt;

type
    TModelComponentsConnectionFireDAC = class(TInterfacedObject, IModelComponentsConnection)
      FDConnection : TFDConnection;
      FQuery       : TFDQuery;
      private
      public
        constructor Create;
        destructor Destroy; override;
        class function New : IModelComponentsConnection;
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

uses
  System.SysUtils, Vcl.Forms;

{ TModelComponentsConnectionFireDAC }

function TModelComponentsConnectionFireDAC.Active(AValue: Boolean): IModelComponentsConnection;
begin
  Result := Self;
end;

function TModelComponentsConnectionFireDAC.ClearSQL: IModelComponentsConnection;
begin
  Result := Self;
  Self.FQuery.SQL.Clear;
end;

constructor TModelComponentsConnectionFireDAC.Create;
begin
  FDConnection := TFDConnection.Create(nil);
  FQuery       := TFDQuery.Create(nil);
  FQuery.Connection := FDConnection;

  FDConnection.Params.DriverID := 'SQLite';
  FDConnection.Params.Database := ExtractFilePath(Application.ExeName) + '\database\GerenciadorPostoABC.db';
  FDConnection.Params.Add('LockingMode=Normal');
  FDConnection.Params.Add('Synchronous=Normal');
  FDConnection.Connected;
end;

function TModelComponentsConnectionFireDAC.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelComponentsConnectionFireDAC.Destroy;
begin
  FQuery.Free;
  FDConnection.Free;
  inherited;
end;

function TModelComponentsConnectionFireDAC.ExecSQL: IModelComponentsConnection;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

class function TModelComponentsConnectionFireDAC.New: IModelComponentsConnection;
begin
    Result := Self.Create;
end;

function TModelComponentsConnectionFireDAC.Open: IModelComponentsConnection;
begin
  Result := Self;
  FQuery.Open;
end;

function TModelComponentsConnectionFireDAC.ParamName(AParamName: string; AValue: variant): IModelComponentsConnection;
begin
  Result := Self;
  FQuery.ParamByName(AParamName).Value := AValue;
end;

function TModelComponentsConnectionFireDAC.ParamName(AParamName, AValue: string): IModelComponentsConnection;
begin
  Result := Self;
  FQuery.ParamByName(AParamName).AsString := QuotedStr(AValue);
end;

function TModelComponentsConnectionFireDAC.ParamName(AParamName: string; AValue: integer): IModelComponentsConnection;
begin
  Result := Self;
  FQuery.ParamByName(AParamName).AsInteger := AValue;
end;

function TModelComponentsConnectionFireDAC.SQL(AVAlue: string): IModelComponentsConnection;
begin
  Result := Self;
  FQuery.SQL.Add(AValue);
end;

end.
