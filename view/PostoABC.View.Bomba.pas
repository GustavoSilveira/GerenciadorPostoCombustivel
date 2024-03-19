unit PostoABC.View.Bomba;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, PostoABC.Controller.Contract, Vcl.DBCtrls, Vcl.Samples.Spin;
type
  TfrmBombas = class(TForm)
    DBGrid1: TDBGrid;
    dsBombas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    btnGet: TButton;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    dsTanques: TDataSource;
    DBLkpTanque: TDBLookupComboBox;
    Label3: TLabel;
    edtNumeroBomba: TSpinEdit;
    btnNovo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbCboTanqueEnter(Sender: TObject);
    procedure LimparCampos;
    procedure btnNovoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDAO : IController;
  public
    { Public declarations }
  end;
var
  frmBombas: TfrmBombas;
implementation
uses
  PostoABC.Controller;
{$R *.dfm}

procedure TfrmBombas.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBombas.btnDeleteClick(Sender: TObject);
begin
  if (dsTanques.DataSet.IsEmpty) then
    raise Exception.Create('Não existem registros.');
  if VarIsNull(dsTanques.DataSet.FieldByName('ID').AsInteger) then
    raise Exception.Create('Selecione um registro.');
  if (MessageDlg('Deseja realmente excluir?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo) then exit;
  FDAO
    .Bombas
      .This
        .IdBomba(dsBombas.DataSet.FieldByName('ID').AsInteger);
  FDAO
    .Bombas
      .Delete
      .Get;
  btnGetClick(Sender);
end;

procedure TfrmBombas.btnGetClick(Sender: TObject);
begin
  btnNovoClick(Sender);
  btnInsert.Enabled := false;
  edtNumeroBomba.Enabled := false;
  DBLkpTanque.Enabled := false;
  FDAO
    .Bombas
      .Get;
end;

procedure TfrmBombas.btnInsertClick(Sender: TObject);
begin
  FDAO
    .Bombas
      .This
        .NumeroBomba(edtNumeroBomba.Text)
        .IdTanque(dsTanques.DataSet.FieldByName('ID').AsInteger);
  if not VarIsnull(FDAO
                    .Bombas
                      .Insert
                      .Get) then
    btnGetClick(Sender);
end;

procedure TfrmBombas.btnUpdateClick(Sender: TObject);
begin
  if (dsTanques.DataSet.IsEmpty) then
    raise Exception.Create('Não existem registros.');
  if (VarIsNull(dsBombas.DataSet.FieldByName('ID').AsInteger) or (DBLkpTanque.KeyValue <> -1)) then
    raise Exception.Create('Selecione um registro.');
  FDAO
    .Bombas
      .This
        .IdBomba(dsBombas.DataSet.FieldByName('ID').AsInteger)
        .NumeroBomba(edtNumeroBomba.Text)
        .IdTanque(dsTanques.DataSet.FieldByName('ID').AsInteger);
  if not VarIsnull(FDAO
                    .Bombas
                      .Update
                      .Get) then
    btnGetClick(Sender);
end;

procedure TfrmBombas.dbCboTanqueEnter(Sender: TObject);
begin
  FDAO
    .Tanques
      .DataSet(dsTanques)
      .Get;
end;

procedure TfrmBombas.FormCreate(Sender: TObject);
begin
  FDAO := TController.New;
  FDAO
    .Tanques
      .DataSet(dsTanques)
      .Get;
  FDAO
    .Bombas
      .DataSet(dsBombas)
      .Get;
end;
procedure TfrmBombas.LimparCampos;
begin
  edtNumeroBomba.Value := 0;
  DBLkpTanque.KeyValue := -1;
end;

procedure TfrmBombas.btnNovoClick(Sender: TObject);
begin
  LimparCampos;
  btnInsert.Enabled := true;
  btnUpdate.Enabled := false;
  btnDelete.Enabled := false;
  edtNumeroBomba.Enabled := true;
  DBLkpTanque.Enabled := true;
  DBLkpTanque.SetFocus;
end;

procedure TfrmBombas.DBGrid1CellClick(Column: TColumn);
begin
  edtNumeroBomba.Text := dsBombas.DataSet.FieldByName('NUMERO_BOMBA').AsString;
  DBLkpTanque.KeyValue := FloatToStr(dsBombas.DataSet.FieldByName('ID_TANQUE').AsFloat);
  btnUpdate.Enabled := true;
  btnDelete.Enabled := true;
  btnInsert.Enabled := False;
  edtNumeroBomba.Enabled := true;
  DBLkpTanque.Enabled := true;
end;

procedure TfrmBombas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (btnInsert.Enabled) and (MessageDlg('Registro não salvo, deseja realmente sair?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Action := caNone;
end;

end.
