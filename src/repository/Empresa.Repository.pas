unit Empresa.Repository;

interface

uses
	System.Generics.Collections,
	FireDAC.Comp.Client,
	Empresa.Model,
    Empresa.Mapper,
    Data.DB;

type
	TEmpresaRepository = class
	private
		FConnection: TFDConnection;
	public
		constructor Create(AConnection: TFDConnection);

		function BuscarPorId(AId: Integer): TEmpresaModel;
		function Listar: TObjectList<TEmpresaModel>;
		procedure Gravar(const AEmpresa: TEmpresaModel);
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

function TEmpresaRepository.BuscarPorId(AId: Integer): TEmpresaModel;
var
    Q: TFDQuery;
begin
    Result := nil;

    Q := TFDQuery.Create(nil);
    Q.Connection := FConnection;
    try
      Q.Open('SELECT FIRST 1 * FROM EMPRESA WHERE CD_EMPRESA = :C', [AId]);

      if Q.IsEmpty then Exit;

      Result := TEmpresaModel.Create;
      TEmpresaMapper.FromDataSet(Q, Result);
    finally
      FreeAndNil(Q);
    end;
end;

function TEmpresaRepository.Listar: TObjectList<TEmpresaModel>;
var
    Q: TFDQuery;
    E: TEmpresaModel;
begin
    Result := TObjectList<TEmpresaModel>.Create(True);

    Q := TFDQuery.Create(nil);
    Q.Connection := FConnection;
    try
      Q.Open('SELECT * FROM EMPRESA');

      if Q.IsEmpty then Exit;

      Q.First;
      while not Q.Eof do
      begin
        E := TEmpresaModel.Create;
        TEmpresaMapper.FromDataSet(Q, E);
        Result.Add(E);
        Q.Next;
      end;
    finally
      FreeAndNil(Q);
    end;
end;

procedure TEmpresaRepository.Gravar(const AEmpresa: TEmpresaModel);
var
    Q: TFDQuery;
begin
	Q := TFDQuery.Create(nil);
    Q.Connection := FConnection;
    try
        Q.Open('SELECT * FROM EMPRESA WHERE CD_EMPRESA = :C', [AEmpresa.Codigo]);

        if Q.IsEmpty then 
        begin
            Q.Append;
            AEmpresa.DataCadastro := Now;
        end
        else Q.Edit;

        TEmpresaMapper.FromModel(AEmpresa, Q);

        Q.Post;
    finally
        FreeAndNil(Q);
    end;
end;

procedure TEmpresaRepository.Excluir(AId: Integer);
var
    Q: TFDQuery;
begin
	Q := TFDQuery.Create(nil);
    Q.Connection := FConnection;
    try
        Q.ExecSQL('DELETE FROM EMPRESA WHERE CD_EMPRESA = :C', [AId]);
    finally
        FreeAndNil(Q);
    end;
end;

end.
