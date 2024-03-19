unit PostoABC.Model.Entities.Bomba;

interface

type
  TBomba = class
  private
    FIdBomba : integer;
    FNumeroBomba : integer;
    FValorLitro : currency;
    FIdTanque : integer;
  public
    constructor Create;
    destructor Destroy; override;
    function IdBomba(AValue : integer) : TBomba; overload;
    function IdBomba : integer; overload;
    function NumeroBomba(AValue : string) : TBomba; overload;
    function NumeroBomba : integer; overload;
    function IdTanque(AValue : integer) : TBomba; overload;
    function IdTanque : integer; overload;
  end;

implementation

uses
  System.SysUtils;

{ TBomba }

constructor TBomba.Create;
begin

end;

destructor TBomba.Destroy;
begin

  inherited;
end;

function TBomba.IdBomba(AValue: integer): TBomba;
begin
  Result := Self;
  FIdBomba := AValue;
end;

function TBomba.IdBomba: integer;
begin
  Result := FIdBomba;
end;

function TBomba.NumeroBomba: integer;
begin
  if FNumeroBomba <= 0 then
    raise Exception.Create('Número da bomba não pode ser menor ou igual a zero.');

  Result := FNumeroBomba;
end;

function TBomba.NumeroBomba(AValue: string): TBomba;
begin
  Result := Self;
  FNumeroBomba := StrToInt(AValue);
end;

function TBomba.IdTanque: integer;
begin
  if FIdTanque <= 0 then
    raise Exception.Create('Informe o Id do tanque');

  Result := FIdTanque;
end;

function TBomba.IdTanque(AValue: integer): TBomba;
begin
  Result := Self;
  Self.FIdTanque := AValue;
end;

end.
