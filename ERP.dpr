program ERP;

{$APPTYPE GUI}

uses
  Vcl.Forms,
  System.SysUtils,
  // Comum
  Conexao in 'src\config\Conexao.pas',
  Session in 'src\config\Session.pas',
  Utils in 'src\common\Utils.pas',
  Constantes in 'src\common\Constantes.pas',

  // componentes
  MyEdit in 'src\components\MyEdit.pas',
  MyLabel in 'src\components\MyLabel.pas',
  MyCheckBox in 'src\components\MyCheckBox.pas',
  MyMemo in 'src\components\MyMemo.pas',
  MyPanel in 'src\components\MyPanel.pas',
  MyButton in 'src\components\MyButton.pas',
  MyComboBox in 'src\components\MyComboBox.pas',
  MyGrid in 'src\components\MyGrid.pas',

  // Models
  Usuario.Model in 'src\model\Usuario.Model.pas',
  Empresa.Model in 'src\model\Empresa.Model.pas',

  // Mappers
  Usuario.Mapper in 'src\mapper\Usuario.Mapper.pas',
  Empresa.Mapper in 'src\mapper\Empresa.Mapper.pas',

  // Repository
  Empresa.Repository in 'src\repository\Empresa.Repository.pas',
  Login.Repository in 'src\repository\Login.Repository.pas',
  
  // Service
  Empresa.Service in 'src\service\Empresa.Service.pas',
  Login.Service in 'src\service\Login.Service.pas',

  // Views
  Login.View in 'src\view\Login.View.pas',
  MenuPrincipal.View in 'src\view\MenuPrincipal.View.pas',
  CadEmpresa.View in 'src\view\CadEmpresa.View.pas',
  GerencialBase.View in 'src\view\GerencialBase.View.pas';

var
  FrmLogin: TLoginView;
  FMenuPrincipal: TMenuPrincipalView;
  Ok: Boolean;

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  
  FrmLogin := TLoginView.Create(nil);
  try
    Ok := FrmLogin.ShowModal = 1;
  finally
    FrmLogin.Free;
  end;

  if Ok then
  begin
    FMenuPrincipal := TMenuPrincipalView.Create(nil);
    try
      FMenuPrincipal.ShowModal;
    finally
      FreeAndNil(FMenuPrincipal);
    end;
  end;

  Application.Run;
end.