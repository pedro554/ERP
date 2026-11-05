unit Conexao;

interface

uses
	System.SysUtils, Firedac.Comp.Client, Firedac.Stan.Def, Firedac.Stan.Async, Firedac.DApt, Firedac.Phys.FB, Firedac.Phys.FBDef,
    Firedac.Phys, Firedac.Stan.Intf, Firedac.Stan.Option, Firedac.Stan.Error, Firedac.UI.Intf, Firedac.VCLUI.Wait, Firedac.Comp.UI,
    System.Classes, Data.DB;

type
	TConexao = class
	private
        class var FConexao: TFDConnection;
        class var FDriver: TFDPhysFBDriverLink;
        class procedure ConfigurarConexao;
        class procedure ConfigurarDriver;
        class procedure ConectarBanco;
	public
        class function Conexao(AOwner: TComponent): TFDConnection;
	end;

implementation

class function TConexao.Conexao(AOwner: TComponent): TFDConnection;
begin
    FConexao := TFDConnection.Create(AOwner);
    FDriver := TFDPhysFBDriverLink.Create(AOwner);

    ConfigurarConexao;
    ConfigurarDriver;
    ConectarBanco;

    Result := FConexao;
end;

class procedure TConexao.ConfigurarConexao;
begin
    FConexao.Params.DriverID := 'FB';
    FConexao.Params.Database := GetCurrentDir + '\ERP.FDB'; 
    FConexao.Params.UserName := 'SYSDBA';
    FConexao.Params.Password := 'masterkey';
end;

class procedure TConexao.ConfigurarDriver;
begin
    FDriver.VendorLib := GetCurrentDir + '\fbclient.dll';
end;

class procedure TConexao.ConectarBanco;
begin
    try 
        FConexao.Connected := True;
    except
        on E: Exception do
            raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
    end;
end;

end.
