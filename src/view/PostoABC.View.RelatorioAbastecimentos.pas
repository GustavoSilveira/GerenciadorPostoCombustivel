unit PostoABC.View.RelatorioAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, PostoABC.Controller.Contract,
  Data.DB;

type
  TfrmRelatorioAbastecimento = class(TForm)
    dsAbastecimentos: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBTTanque: TRLDBText;
    RLDBTBomba: TRLDBText;
    RLDBTValorAbastecimento: TRLDBText;
    RLDBTImposto: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBResult2: TRLDBResult;
    RLLabel8: TRLLabel;
    RLDraw2: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLBand5: TRLBand;
    RLDBResult3: TRLDBResult;
    RLLabel7: TRLLabel;
    RLDraw3: TRLDraw;
    RLDBResult4: TRLDBResult;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    procedure FormCreate(Sender: TObject);
    procedure RLDBTTotalBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText3BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBTValorAbastecimentoBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBResult2BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
    FDAO : IController;
  public
    { Public declarations }
    FDataIni : TDate;
    FDataFim : TDate;
  end;

var
  frmRelatorioAbastecimento: TfrmRelatorioAbastecimento;

implementation

uses
  PostoABC.Controller, System.SysUtils;

{$R *.dfm}

procedure TfrmRelatorioAbastecimento.FormCreate(Sender: TObject);
begin
  FDAO := TController.New;

  FDAO
    .Abastecimentos
    .DataSet(dsAbastecimentos);

  FDAO
    .Abastecimentos
    .GetReport(FDataIni, FDataFim);
end;

procedure TfrmRelatorioAbastecimento.RLDBResult2BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := formatfloat('#0.00', StrToCurr(AText));
end;

procedure TfrmRelatorioAbastecimento.RLDBText3BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := formatfloat('#0.00', StrToCurr(AText));
end;

procedure TfrmRelatorioAbastecimento.RLDBTValorAbastecimentoBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := formatfloat('#0.00', StrToCurr(AText));
end;

procedure TfrmRelatorioAbastecimento.RLDBTTotalBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := formatfloat('#0.00', StrToCurr(AText));
end;

end.
