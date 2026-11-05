unit Login.View;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  Login.Service,
  Usuario.Model,
  Session,
  MyEdit,
  MyLabel;

type
  TLoginView = class(TForm)
  private
    lblUsuario: TMyLabel;
    lblSenha: TMyLabel;
    edtUsuario: TMyEdit;
    edtSenha: TMyEdit;
    btnLogin: TButton;
    btnSair: TButton;
    btnCriarUsuario: TButton;

    procedure Sair(Sender: TObject);
    procedure Login(Sender: TObject);
    procedure CriarUsuario(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

constructor TLoginView.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);

  Caption := 'Login - ERP';
  Width := 350;
  Height := 250;
  Position := poScreenCenter;

  lblUsuario := TMyLabel.Create(Self);
  lblUsuario.Parent := Self;
  lblUsuario.Caption := 'Usuário';
  lblUsuario.Left := 10;
  lblUsuario.Top := 10;

  edtUsuario := TMyEdit.Create(Self);
  edtUsuario.Parent := Self;
  edtUsuario.Left := 10;
  edtUsuario.Top := 30;
  edtUsuario.Width := 300;

  lblSenha := TMyLabel.Create(Self);
  lblSenha.Parent := Self;
  lblSenha.Caption := 'Senha';
  lblSenha.Left := 10;
  lblSenha.Top := 65;

  edtSenha := TMyEdit.Create(Self);
  edtSenha.Parent := Self;
  edtSenha.Left := 10;
  edtSenha.Top := 85;
  edtSenha.Width := 300;
  edtSenha.PasswordChar := '*';

  btnLogin := TButton.Create(Self);
  btnLogin.Parent := Self;
  btnLogin.Left := 10;
  btnLogin.Top := 125;
  btnLogin.Caption := 'Login';
  btnLogin.OnClick := Login;

  btnSair := TButton.Create(Self);
  btnSair.Parent := Self;
  btnSair.Left := 100;
  btnSair.Top := 125;
  btnSair.Caption := 'Sair';
  btnSair.OnClick := Sair;

  btnCriarUsuario := TButton.Create(Self);
  btnCriarUsuario.Parent := Self;
  btnCriarUsuario.Left := 190;
  btnCriarUsuario.Top := 125;
  btnCriarUsuario.Caption := 'Criar Usuário';
  btnCriarUsuario.OnClick := CriarUsuario;
end;

procedure TLoginView.Sair(Sender: TObject);
begin
  Close;
end;

procedure TLoginView.Login(Sender: TObject);
var
  LoginService: TLoginService;
  Usuario: TUsuario;
begin
  Usuario := nil;
  LoginService := TLoginService.Create;
  try
      Usuario := LoginService.AutenticarUsuario(edtUsuario.Text, edtSenha.Text);
      if Assigned(Usuario) then
      begin
          TSession.CodigoUsuario := Usuario.Id;
          TSession.NomeUsuario := Usuario.Nome;
          ModalResult := mrOk;
      end
      else
          raise Exception.Create('Usuário ou senha inválidos.');
  finally
      LoginService.Free;
      Usuario.Free;
  end;
end;

procedure TLoginView.CriarUsuario(Sender: TObject);
begin
  ShowMessage('Funcionalidade de criação de usuário ainda não implementada.');
end;

end.