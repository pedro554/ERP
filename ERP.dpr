program ERP;

{$APPTYPE GUI}

uses
  Vcl.Forms,
  System.SysUtils,
  // componentes
  MyEdit in 'src\components\MyEdit.pas',
  MyLabel in 'src\components\MyLabel.pas',
  MyCheckBox in 'src\components\MyCheckBox.pas',
  MyMemo in 'src\components\MyMemo.pas',
  MyPanel in 'src\components\MyPanel.pas',
  MyButton in 'src\components\MyButton.pas',

  Login.View in 'src\view\Login.View.pas',
  Conexao in 'src\config\Conexao.pas',
  Login.Service in 'src\service\Login.Service.pas',
  Usuario.Model in 'src\model\Usuario.Model.pas',
  Session in 'src\config\Session.pas',
  Usuario.Mapper in 'src\mapper\Usuario.Mapper.pas',
  Login.Repository in 'src\repository\Login.Repository.pas',
  Utils in 'src\common\Utils.pas',
  MenuPrincipal.View in 'src\view\MenuPrincipal.View.pas',
  CadEmpresa.View in 'src\view\CadEmpresa.View.pas';

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