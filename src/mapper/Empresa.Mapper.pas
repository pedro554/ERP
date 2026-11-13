unit Empresa.Mapper;

interface

uses
	Data.DB,
	Empresa.Model;

type
	TEmpresaMapper = class
	public
		class function FromDataSet(ADataSet: TDataSet; AEmpresa: TEmpresaModel): TEmpresaModel;
	end;

implementation

class function TEmpresaMapper.FromDataSet(ADataSet: TDataSet; AEmpresa: TEmpresaModel): TEmpresaModel;
begin
	AEmpresa.Codigo := ADataSet.FieldByName('CD_EMPRESA').AsInteger;
	AEmpresa.Ativo := ADataSet.FieldByName('ST_ATIVO').AsBoolean;
	AEmpresa.Nome := ADataSet.FieldByName('NM_EMPRESA').AsString;
    AEmpresa.Observacao := ADataSet.FieldByName('DS_OBSERVACAO').AsString;

	if (not ADataSet.FieldByName('DT_CADASTRO').IsNull) or 
    (ADataSet.FieldByName('DT_CADASTRO').AsDateTime > 0) then
		AEmpresa.DataCadastro := ADataSet.FieldByName('DT_CADASTRO').AsDateTime;
end;

end.
