unit Empresa.Mapper;

interface

uses
	Data.DB,
	Empresa.Model;

type
	TEmpresaMapper = class
	public
		class procedure FromDataSet(ADataSet: TDataSet; AEmpresa: TEmpresaModel);
		class procedure FromModel(AModel: TEmpresaModel; ADataSet: TDataSet);
	end;

implementation

class procedure TEmpresaMapper.FromDataSet(ADataSet: TDataSet; AEmpresa: TEmpresaModel);
begin
	AEmpresa.Codigo := ADataSet.FieldByName('CD_EMPRESA').AsInteger;
	AEmpresa.Ativo := ADataSet.FieldByName('ST_ATIVO').AsBoolean;
	AEmpresa.Nome := ADataSet.FieldByName('NM_EMPRESA').AsString;

	if (not ADataSet.FieldByName('DT_CADASTRO').IsNull) or 
    (ADataSet.FieldByName('DT_CADASTRO').AsDateTime > 0) then
		AEmpresa.DataCadastro := ADataSet.FieldByName('DT_CADASTRO').AsDateTime;
end;

class procedure TEmpresaMapper.FromModel(AModel: TEmpresaModel; ADataSet: TDataSet);
begin
	ADataSet.FieldByName('CD_EMPRESA').AsInteger := AModel.Codigo;
	ADataSet.FieldByName('ST_ATIVO').AsBoolean := AModel.Ativo;
	ADataSet.FieldByName('NM_EMPRESA').AsString := AModel.Nome;
	ADataSet.FieldByName('DT_CADASTRO').AsDateTime := AModel.DataCadastro;
end;

end.
