unit Empresa.Model;

interface

uses
    System.SysUtils, System.Classes;

type
    TEmpresaModel = class(TObject)
    private
        FCodigo: Integer;
        FNome: String;
        FAtivo: Boolean;
        FObservacao: String;
        FDataCadastro: TDateTime;
    public
        procedure Validar;
        
        property Codigo: Integer read FCodigo write FCodigo;
        property Nome: String read FNome write FNome;
        property Ativo: Boolean read FAtivo write FAtivo;
        property Observacao: String read FObservacao write FObservacao;
        property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    end;

implementation

procedure TEmpresaModel.Validar;
begin
    if FCodigo <= 0 then
        raise Exception.Create('Código Empresa inválido.');
    if FNome.Trim.IsEmpty then
        raise Exception.Create('Informe o nome da Empresa.');
end;

end.
