unit Empresa.Repository;

interface

uses
	System.Generics.Collections,
	FireDAC.Comp.Client,
	Empresa.Model;

type
	TEmpresaRepository = class
	private
		FConnection: TFDConnection;
	public
		constructor Create(AConnection: TFDConnection);

		function BuscarPorId(AId: Integer): TEmpresa;
		function Listar: TObjectList<TEmpresa>;
		procedure Gravar(const AEmpresa: TEmpresa);
		procedure Atualizar(const AEmpresa: TEmpresa);
		procedure Excluir(AId: Integer);
	end;

implementation

uses
	System.SysUtils;

constructor TEmpresaRepository.Create(AConnection: TFDConnection);
begin
	inherited Create;
	if AConnection = nil then
		raise EArgumentNilException.Create('AConnection');

	FConnection := AConnection;
end;

function TEmpresaRepository.BuscarPorId(AId: Integer): TEmpresa;
begin
	// TODO: consultar e mapear a empresa correspondente.
	Result := nil;
end;

function TEmpresaRepository.Listar: TObjectList<TEmpresa>;
begin
	// TODO: consultar e mapear as empresas.
	Result := TObjectList<TEmpresa>.Create(True);
end;

procedure TEmpresaRepository.Gravar(const AEmpresa: TEmpresa);
begin
	// TODO: inserir a empresa no banco de dados.
end;

procedure TEmpresaRepository.Atualizar(const AEmpresa: TEmpresa);
begin
	// TODO: atualizar a empresa no banco de dados.
end;

procedure TEmpresaRepository.Excluir(AId: Integer);
begin
	// TODO: excluir a empresa correspondente.
end;

end.
