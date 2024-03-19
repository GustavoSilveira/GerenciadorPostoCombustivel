unit PostoABC.Model.Entities.Abastecimento;

interface

type
  TAbastecimento = class
  private
    FIdAbastecimento    : integer;
    FDataAbastecimento  : TDateTime;
    FIdBomba            : integer;
    FValorPorLitro      : currency;
    FQuantidaDeLitros   : currency;
    FImposto            : currency;
    FValorAbastecimento : currency;
  public
    constructor Create;
    destructor Destroy; override;
    function IdAbastecimento(AValue : integer) : TAbastecimento; overload;
    function IdAbastecimento : integer; overload;
    function DataAbastecimento(AValue : TDateTime) : TAbastecimento; overload;
    function DataAbastecimento : TDateTime; overload;
    function IdBomba(AValue : integer) : TAbastecimento; overload;
    function IdBomba : integer; overload;
    function ValorPorLitro(AValue : currency) : TAbastecimento; overload;
    function ValorPorLitro : currency; overload;
    function QuantidaDeLitros(AValue : currency) : TAbastecimento; overload;
    function QuantidaDeLitros : currency; overload;
    function Imposto(AValue : currency) : TAbastecimento; overload;
    function Imposto : currency; overload;
    function ValorAbastecimento(AValue : currency) : TAbastecimento; overload;
    function ValorAbastecimento : currency; overload;
  end;

implementation

uses
  System.SysUtils;

{ TAbastecimento }

constructor TAbastecimento.Create;
begin

end;

function TAbastecimento.DataAbastecimento: TDateTime;
begin
  Result := FDataAbastecimento;
end;

function TAbastecimento.DataAbastecimento(AValue: TDateTime): TAbastecimento;
begin
  Result := Self;
  FDataAbastecimento := AValue;
end;

destructor TAbastecimento.Destroy;
begin

  inherited;
end;

function TAbastecimento.IdAbastecimento(AValue: integer): TAbastecimento;
begin
  Result := Self;
  FIdAbastecimento := AValue;
end;

function TAbastecimento.IdAbastecimento: integer;
begin
  if FIdAbastecimento <= 0 then
    raise Exception.Create('Infome o Id do abastecimento');

  Result := Self.FIdAbastecimento;
end;

function TAbastecimento.IdBomba(AValue: integer): TAbastecimento;
begin
  Result := Self;
  FIdBomba := AValue;
end;

function TAbastecimento.IdBomba: integer;
begin
  if FIdBomba <= 0 then
    raise Exception.Create('Informe Id da bomba');

  Result := FIdBomba;
end;

function TAbastecimento.Imposto: currency;
begin
  Result := FImposto;
end;

function TAbastecimento.Imposto(AValue: currency): TAbastecimento;
begin
  Result := Self;
  FImposto := AValue;
end;

function TAbastecimento.QuantidadeLitros: currency;
begin
  Result := StrToCurr(FormatFloat('#,0.000', FQuantidadeLitros));
end;

function TAbastecimento.QuantidadeLitros(AValue: currency): TAbastecimento;
begin
  Result := Self;
  FQuantidadeLitros := AValue;
end;

function TAbastecimento.ValorAbastecimento(AValue: currency): TAbastecimento;
begin
  Result := Self;
  FValorAbastecimento := AValue;
end;

function TAbastecimento.ValorAbastecimento: currency;
begin
  if FValorAbastecimento <= 0 then
    raise Exception.Create('Valor R$ desejado do abastecimento inválido');

  Result := StrToCurr(FormatFloat('#,0.000', FValorAbastecimento));
end;

function TAbastecimento.ValorPorLitro(AValue: currency): TAbastecimento;
begin
  Result := Self;
  FValorPorLitro := AValue;
end;

function TAbastecimento.ValorPorLitro: currency;
begin
  if FValorPorLitro <= 0 then
    raise Exception.Create('Valor do litro inválido');

  Result := StrToCurr(FormatFloat('#,0.000', FValorPorLitro));
end;

end.
