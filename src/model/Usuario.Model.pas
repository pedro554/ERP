unit Usuario.Model;

interface

uses
	System.SysUtils;

type
	TUsuario = class
	private
		FId: Integer;
		FNome: string;
		FLogin: string;
		FSenha: string;
		FAtivo: Boolean;
	public
		procedure Validar;

		property Id: Integer read FId write FId;
		property Nome: string read FNome write FNome;
		property Login: string read FLogin write FLogin;
		property Senha: string read FSenha write FSenha;
		property Ativo: Boolean read FAtivo write FAtivo;
	end;

implementation

procedure TUsuario.Validar;
begin
	if FNome.Trim.IsEmpty then
		raise Exception.Create('O nome do usuário é obrigatório.');

	if FLogin.Trim.IsEmpty then
		raise Exception.Create('O login do usuário é obrigatório.');

	if FSenha.Trim.IsEmpty then
		raise Exception.Create('A senha do usuário é obrigatória.');
end;

end.
