unit Login.Repository;

interface

uses
	System.SysUtils,
	System.Classes,
    Usuario.Model,
    Conexao,
    Usuario.Mapper,
    Firedac.Comp.Client,
    FireDAC.Stan.Param,
    Data.DB;

type
	TLoginRepository = class
	public
        function AutenticarUsuario(const ALogin, ASenha: string): TUsuario;
	end;

implementation

function TLoginRepository.AutenticarUsuario(const ALogin, ASenha: string): TUsuario;
var
    Query: TFDQuery;
    Usuario: TUsuario;
begin
    Result := nil;
    Query := TFDQuery.Create(nil);
    try
        Query.Connection := TConexao.Conexao(Query);
        Query.SQL.Text := 'SELECT * FROM USUARIO WHERE LOGIN = :LOGIN AND SENHA = :SENHA';
        Query.ParamByName('LOGIN').AsString := ALogin;
        Query.ParamByName('SENHA').AsString := ASenha;
        Query.Open;

        if Query.IsEmpty then
            Exit;

        Usuario := TUsuario.Create;

        TUsuarioMapper.DataSetToUsuario(Query, Usuario);

        Result := Usuario;
    finally
        Query.Free;
    end;
end;

end.
