unit PostoABC.Model.Entities.Tanque;

interface

type
  TTanque = class
  private
    FIdTanque         : integer;
    FDescricao        : string;
    FValorLitro       : currency;
  public
    constructor Create;
    destructor Destroy; override;
    function IdTanque(AValue : integer) : TTanque; overload;
    function IdTanque : integer; overload;
    function Descricao(AValue : string) : TTanque; overload;
    function Descricao : string; overload;
    function ValorLitro(AValue : currency) : TTanque; overload;
    function ValorLitro : currency; overload;
    function ValorLitro(AValue : string) : TTanque; overload;
  end;

implementation

uses
  System.SysUtils;

{ TTanque }

function TTanque.ValorLitro(AValue: currency): TTanque;
begin
  Result := Self;
  FValorLitro := AValue;
end;

function TTanque.ValorLitro: currency;
begin
  if FValorLitro <= 0 then
    raise Exception.Create('Informe o valor do litro');

  Result := FValorLitro;
end;

function TTanque.ValorLitro(AValue: string): TTanque;
begin
  Result := Self;
  Self.ValorLitro(StrToCurrDef(AValue, 0));
end;

constructor TTanque.Create;
begin

end;

destructor TTanque.Destroy;
begin

  inherited;
end;

function TTanque.IdTanque(AValue: integer): TTanque;
begin
  Result := Self;
  Self.FIdTanque := AValue;
end;

function TTanque.IdTanque: integer;
begin
  Result := Self.FIdTanque
end;


function TTanque.Descricao: string;
begin
  if FDescricao.Trim.Length = 0 then
    raise Exception.Create('Informe a descrição do tanque (Ex: Gasolina ou Óleo diesel) e valor litro.');

  Result := Self.FDescricao;
end;

function TTanque.Descricao(AValue: string): TTanque;
begin
  Result := Self;
  Self.FDescricao := AValue;
end;

end.
