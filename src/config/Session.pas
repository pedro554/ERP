unit Session;

interface

type
	TSession = class
	private
		class var FCodigoUsuario: Integer;
        class var FNomeUsuario: string;
	public
        class property CodigoUsuario: Integer read FCodigoUsuario write FCodigoUsuario;
        class property NomeUsuario: string read FNomeUsuario write FNomeUsuario;
	end;

implementation

end.
