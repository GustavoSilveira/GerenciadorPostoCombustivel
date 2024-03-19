unit PostoABC.View.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, PostoABC.Controller.Contract, StrUtils;

type
  TfrmTanques = class(TForm)
    edtValorLitro: TEdit;
    DBGrid1: TDBGrid;
    dsTanques: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    btnGet: TButton;
    btnInsert: TButton;
    btnUpdate: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    edtTanqueDescricao: TEdit;
    Label3: TLabel;
    btnNovo: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure LimparCampos;
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDAO : IController;
  public
    { Public declarations }
  end;

var
  frmTanques: TfrmTanques;

implementation

uses
  PostoABC.Controller;

{$R *.dfm}

procedure TfrmTanques.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTanques.btnDeleteClick(Sender: TObject);
begin
  if (dsTanques.DataSet.IsEmpty) then
    raise Exception.Create('Não existem registros.');

  if VarIsNull(dsTanques.DataSet.FieldByName('ID').AsInteger) then
    raise Exception.Create('Selecione um registro.');

  if (MessageDlg('Deseja realmente excluir?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo) then exit;

  FDAO
    .Tanques
      .This
        .IdTanque(dsTanques.DataSet.FieldByName('ID').AsInteger);

  FDAO
    .Tanques
      .Delete
      .Get;

  btnGetClick(Sender);
end;

procedure TfrmTanques.btnGetClick(Sender: TObject);
begin
  btnNovoClick(Sender);
  btnInsert.Enabled := false;
  edtTanqueDescricao.Enabled := false;
  edtValorLitro.Enabled := false;
  FDAO
    .Tanques
      .Get;
end;

procedure TfrmTanques.btnInsertClick(Sender: TObject);
begin
  FDAO
    .Tanques
      .This
        .Descricao(AnsiReplaceStr(edtTanqueDescricao.Text, '''' , '' ))
        .ValorLitro(edtValorLitro.Text);

  if not VarIsnull(FDAO
                    .Tanques
                      .Insert
                      .Get) then
    btnGetClick(Sender);

end;

procedure TfrmTanques.btnUpdateClick(Sender: TObject);
begin
  if (dsTanques.DataSet.IsEmpty) then
    raise Exception.Create('Não existem registros.');

  if (VarIsNull(dsTanques.DataSet.FieldByName('ID').AsInteger) or (Trim(edtTanqueDescricao.Text) = '')) then
    raise Exception.Create('Selecione um registro.');

  FDAO
    .Tanques
      .This
        .IdTanque(dsTanques.DataSet.FieldByName('ID').AsInteger)
        .Descricao(edtTanqueDescricao.Text)
        .ValorLitro(edtValorLitro.Text);

  if not VarIsnull(FDAO
                    .Tanques
                      .Update
                      .Get) then
    btnGetClick(Sender);
end;

procedure TfrmTanques.btnNovoClick(Sender: TObject);
begin
  LimparCampos;
  btnInsert.Enabled := true;
  btnUpdate.Enabled := false;
  btnDelete.Enabled := false;
  edtTanqueDescricao.Enabled := true;
  edtValorLitro.Enabled := true;
  edtTanqueDescricao.SetFocus;
end;

procedure TfrmTanques.FormCreate(Sender: TObject);
begin
  FDAO := TController.New;
  FDAO
    .Tanques
      .DataSet(dsTanques)
      .Get;
end;

procedure TfrmTanques.DBGrid1CellClick(Column: TColumn);
begin
  edtTanqueDescricao.Text := dsTanques.DataSet.FieldByName('DESCRICAO').AsString;
  edtValorLitro.Text := FloatToStr(dsTanques.DataSet.FieldByName('VALOR_LITRO').AsFloat);
  btnUpdate.Enabled := true;
  btnDelete.Enabled := true;
  btnInsert.Enabled := False;
  edtTanqueDescricao.Enabled := true;
  edtValorLitro.Enabled := true;
end;

procedure TfrmTanques.LimparCampos;
begin
  edtTanqueDescricao.Clear;
  edtValorLitro.Clear;
end;

procedure TfrmTanques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (btnInsert.Enabled) and (MessageDlg('Registro não salvo, deseja realmente sair?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Action := caNone;
end;

end.
