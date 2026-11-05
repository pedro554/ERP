unit Login.Service;

interface

uses
	System.SysUtils,
    Login.Repository,
    Usuario.Model;

type
	TLoginService = class
    private
        LoginRepository: TLoginRepository;
	public
		constructor Create;
        destructor Destroy; override;
        function AutenticarUsuario(const ALogin, ASenha: string): TUsuario;
	end;

implementation

constructor TLoginService.Create;
begin
    LoginRepository := TLoginRepository.Create;
end;

destructor TLoginService.Destroy;
begin
    LoginRepository.Free;
end;

function TLoginService.AutenticarUsuario(const ALogin, ASenha: string): TUsuario;
begin
    Result := LoginRepository.AutenticarUsuario(ALogin, ASenha);
end;

end.
