unit PostoABC.View.RelatorioAbastecimentosParametros;
interface
uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, PostoABC.Controller.Contract,
  Data.DB, Vcl.StdCtrls, Vcl.WinXPickers;
type
  TfrmRelatorioAbastecimentoParametros = class(TForm)
    btnImprimir: TButton;
    DatePickerDataIni: TDatePicker;
    DatePickerDataFim: TDatePicker;
    Label6: TLabel;
    Label5: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FDAO : IController;
  public
    { Public declarations }
  end;
var
  frmRelatorioAbastecimentoParametros: TfrmRelatorioAbastecimentoParametros;
implementation
uses
  PostoABC.Controller,
  System.SysUtils,
  PostoABC.View.RelatorioAbastecimentos;
{$R *.dfm}
procedure TfrmRelatorioAbastecimentoParametros.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioAbastecimentoParametros.btnImprimirClick(
  Sender: TObject);
var
  LFrmRelatorioAbastecimento : TfrmRelatorioAbastecimento;
begin
  LFrmRelatorioAbastecimento := TfrmRelatorioAbastecimento.Create(Self);
  try
    LFrmRelatorioAbastecimento.FDataIni := DatePickerDataIni.Date;
    LFrmRelatorioAbastecimento.FDataFim := DatePickerDataFim.Date;
    LFrmRelatorioAbastecimento.RLReport1.Preview;
  finally
    LFrmRelatorioAbastecimento.Free;
  end;
end;

end.
