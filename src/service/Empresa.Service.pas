unit Empresa.Service;

interface

uses
    System.SysUtils,
    System.Generics.Collections,
	FireDAC.Comp.Client,
	Empresa.Model,
    Empresa.Repository;

type
    TEmpresaService = class
    private
        FRepository: TEmpresaRepository;
    public
        constructor Create(AConnection: TFDConnection);
        destructor Destroy; override;
        
        function BuscarPorId(AId: Integer): TEmpresaModel;
		function Listar: TObjectList<TEmpresaModel>;
		procedure Gravar(const AEmpresa: TEmpresaModel);
		procedure Excluir(AId: Integer);
    end;

implementation

constructor TEmpresaService.Create(AConnection: TFDConnection);
begin
    FRepository := TEmpresaRepository.Create(AConnection);
end;

destructor TEmpresaService.Destroy;
begin
    FRepository.Free;
    inherited;
end;

function TEmpresaService.BuscarPorId(AId: Integer): TEmpresaModel;
begin
    if AId <= 0 then
        raise Exception.Create('Código não informado.');

    Result := FRepository.BuscarPorId(AId);
end;

function TEmpresaService.Listar: TObjectList<TEmpresaModel>;
begin
    Result := FRepository.Listar;
end;

procedure TEmpresaService.Gravar(const AEmpresa: TEmpresaModel);
begin
    if not Assigned(AEmpresa) then
        raise Exception.Create('Empresa não informada.');

    AEmpresa.Validar;

    FRepository.Gravar(AEmpresa);
end;

procedure TEmpresaService.Excluir(AId: Integer);
begin
    if AId <= 0 then
        raise Exception.Create('Código não informado.');

    FRepository.Excluir(AId);
end;

end.
