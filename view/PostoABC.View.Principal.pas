unit PostoABC.View.Principal;
interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, PostoABC.Controller.Contract;
type
  TfrmAbastecimento = class(TForm)
    btnBombas: TButton;
    btnTanques: TButton;
    Label1: TLabel;
    edtValor: TEdit;
    Label2: TLabel;
    edtQuantidade: TEdit;
    Label4: TLabel;
    DBLkpTanqueBomba: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    dsBomba: TDataSource;
    dsAbastecimento: TDataSource;
    btnAbastecer: TButton;
    btnRelatorio: TButton;
    Label3: TLabel;
    Label5: TLabel;
    btnClose: TButton;
    btnCalcularLitros: TButton;
    btnLimpar: TButton;
    btnRemover: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnTanquesClick(Sender: TObject);
    procedure btnBombasClick(Sender: TObject);
    procedure btnAbastecerClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCalcularLitrosClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure dsBombaDataChange(Sender: TObject; Field: TField);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
    FDAO : IController;
    FValorSolicitado  : currency;
    FQuantidadeLitros : currency;
    FValorLitro       : currency;
  public
    { Public declarations }
  end;
var
  frmAbastecimento: TfrmAbastecimento;
implementation
uses
  System.SysUtils,
  PostoABC.Controller,
  PostoABC.Controller.types,
  PostoABC.View.Tanque,
  PostoABC.View.Bomba,
  PostoABC.View.RelatorioAbastecimentos,
  PostoABC.View.RelatorioAbastecimentosParametros;

{$R *.dfm}

procedure TfrmAbastecimento.btnBombasClick(Sender: TObject);
var
  LFrmBombas : TFrmBombas;
begin
  LFrmBombas := TFrmBombas.Create(Self);
  try
    LFrmBombas.ShowModal;
  finally
    FDAO
    .Bombas
      .DataSet(dsBomba)
      .Get;
    LFrmBombas.Free;
  end;
end;

procedure TfrmAbastecimento.btnTanquesClick(Sender: TObject);
var
  LFrmTanques : TfrmTanques;
begin
  LFrmTanques := TfrmTanques.Create(Self);
  try
    LFrmTanques.ShowModal;
  finally
    LFrmTanques.Free
  end;
end;

procedure TfrmAbastecimento.btnRelatorioClick(Sender: TObject);
var
  LFrmRelatorioAbastecimentoParametros : TfrmRelatorioAbastecimentoParametros;
begin
  LFrmRelatorioAbastecimentoParametros := TfrmRelatorioAbastecimentoParametros.Create(Self);
  try
    LFrmRelatorioAbastecimentoParametros.ShowModal;
  finally
    LFrmRelatorioAbastecimentoParametros.Free;
  end;
end;

procedure TfrmAbastecimento.btnRemoverClick(Sender: TObject);
begin
  if (dsAbastecimento.DataSet.IsEmpty) then
    raise Exception.Create('Não existem registros.');

  if VarIsNull(dsAbastecimento.DataSet.FieldByName('ID').AsInteger) then
    raise Exception.Create('Selecione um registro.');

  if (MessageDlg('Deseja realmente excluir?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo) then exit;
  FDAO
    .Abastecimentos
      .This
        .IdAbastecimento(dsAbastecimento.DataSet.FieldByName('ID').AsInteger);
  FDAO
    .Abastecimentos
      .Delete
      .Get;

  FDAO
    .Abastecimentos
      .DataSet(dsAbastecimento)
      .Get;

end;

procedure TfrmAbastecimento.btnAbastecerClick(Sender: TObject);
begin
  btnCalcularLitrosClick(Sender);
  FDAO
    .Abastecimentos
      .This
        .DataAbastecimento(now)
        .IdBomba(dsBomba.DataSet.FieldByName('ID').AsInteger)
        .ValorPorLitro(dsBomba.DataSet.FieldByName('VALOR_LITRO').AsCurrency)
        .QuantidaDeLitros(StrToCurr(edtQuantidade.Text))
        .Imposto(StrToCurr(edtValor.Text) * VALOR_IMPOSTO)
        .ValorAbastecimento(StrToCurr(edtValor.Text));
   if not VarIsnull(FDAO
                      .Abastecimentos
                        .Insert
                        .Get) then btnLimparClick(Sender);
end;

procedure TfrmAbastecimento.dsBombaDataChange(Sender: TObject; Field: TField);
begin
  btnLimparClick(Sender);
end;

procedure TfrmAbastecimento.edtQuantidadeChange(Sender: TObject);
begin
    btnCalcularLitros.Tag := 1;
end;

procedure TfrmAbastecimento.edtValorChange(Sender: TObject);
begin
  btnCalcularLitros.Tag := 2;
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;
  FDAO := TController.New;
  FDAO
    .Abastecimentos
      .DataSet(dsAbastecimento)
      .Get;
  FDAO
    .Bombas
      .DataSet(dsBomba)
      .Get;
end;

procedure TfrmAbastecimento.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimento.btnLimparClick(Sender: TObject);
begin
  edtQuantidade.Text := '0,00';
  edtValor.Text := '0,00';
end;

procedure TfrmAbastecimento.btnCalcularLitrosClick(Sender: TObject);
var
  f: double;
begin
  FValorLitro := 0;
  FQuantidadeLitros := 0;
  if TryStrToFloat(edtQuantidade.Text, f) then
    FQuantidadeLitros := StrToCurr(edtQuantidade.Text)
  else
  begin
    edtQuantidade.SetFocus;
    raise Exception.Create('Informe a quantidade correta em litros.');
  end;
  if TryStrToFloat(edtValor.Text, f) then
    FValorSolicitado := StrToCurr(edtValor.Text)
  else
  begin
    edtValor.SetFocus;
    raise Exception.Create('Informe o correto valor R$ desejado .');
  end;
  if not(dsBomba.DataSet.IsEmpty) and (DBLkpTanqueBomba.KeyValue > 0) then
  begin
    FValorLitro := dsBomba.DataSet.FieldByName('VALOR_LITRO').AsCurrency;
  end
  else
  begin
    DBLkpTanqueBomba.SetFocus;
    raise Exception.Create('Selecione um tanque e bomba.');
  end;
  if (btnCalcularLitros.Tag = 1) then
    edtValor.Text := FormatFloat('#,0.00', FQuantidadeLitros * FValorLitro)
  else
    edtQuantidade.Text := FormatFloat('#,0.000', FValorSolicitado / FValorLitro);
  btnCalcularLitros.Tag := 0;
end;

end.
