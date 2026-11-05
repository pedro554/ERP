unit Usuario.Mapper;

interface

uses
	System.SysUtils,
	System.Classes,
	Data.DB,
	Usuario.Model;

type
	TUsuarioMapper = class
	public
		// Mapeia os campos do DataSet para a entidade TUsuario
		// ADataSet: O DataSet contendo os dados do usuário
		// AUsuario: A instância da entidade TUsuario que será preenchida com os dados do DataSet
		// Utilizado para uma SELECT * FROM USUARIO
		class procedure DataSetToUsuario(const ADataSet: TDataSet; const AUsuario: TUsuario);
	end;

implementation

class procedure TUsuarioMapper.DataSetToUsuario(const ADataSet: TDataSet; const AUsuario: TUsuario);
begin
	AUsuario.Id := ADataSet.FieldByName('ID').AsInteger;
	AUsuario.Nome := ADataSet.FieldByName('NOME').AsString;
	AUsuario.Login := ADataSet.FieldByName('LOGIN').AsString;
	AUsuario.Senha := ADataSet.FieldByName('SENHA').AsString;
	AUsuario.Ativo := ADataSet.FieldByName('ATIVO').AsBoolean;
end;

end.
