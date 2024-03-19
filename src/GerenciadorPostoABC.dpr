program GerenciadorPostoABC;
uses
  Vcl.Forms,
  PostoABC.View.Principal in 'view\PostoABC.View.Principal.pas' {frmAbastecimento},
  PostoABC.Model.Components.Connection.Contract in 'model\components\connection\PostoABC.Model.Components.Connection.Contract.pas',
  PostoABC.Model.Components.Connection.FireDAC in 'model\components\connection\PostoABC.Model.Components.Connection.FireDAC.pas',
  PostoABC.Model.Entities.Tanque in 'model\entities\PostoABC.Model.Entities.Tanque.pas',
  PostoABC.Model.Entities.Bomba in 'model\entities\PostoABC.Model.Entities.Bomba.pas',
  PostoABC.Model.Entities.Abastecimento in 'model\entities\PostoABC.Model.Entities.Abastecimento.pas',
  PostoABC.Model.DAO.Abastecimento in 'model\DAO\PostoABC.Model.DAO.Abastecimento.pas',
  PostoABC.Model.DAO.Tanque in 'model\DAO\PostoABC.Model.DAO.Tanque.pas',
  PostoABC.Model.DAO.Contract in 'model\DAO\PostoABC.Model.DAO.Contract.pas',
  PostoABC.Model.DAO.Bomba in 'model\DAO\PostoABC.Model.DAO.Bomba.pas',
  PostoABC.Controller.Contract in 'controller\PostoABC.Controller.Contract.pas',
  PostoABC.Controller in 'controller\PostoABC.Controller.pas',
  PostoABC.View.Tanque in 'view\PostoABC.View.Tanque.pas' {frmTanques},
  PostoABC.View.Bomba in 'view\PostoABC.View.Bomba.pas' {frmBombas},
  PostoABC.View.RelatorioAbastecimentos in 'view\PostoABC.View.RelatorioAbastecimentos.pas' {frmRelatorioAbastecimento},
PostoABC.View.RelatorioAbastecimentosParametros in 'view\PostoABC.View.RelatorioAbastecimentosParametros.pas' {frmRelatorioAbastecimentoParametros},  
  PostoABC.Controller.types in 'controller\types\PostoABC.Controller.types.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAbastecimento, frmAbastecimento);
  Application.Run;
end.
