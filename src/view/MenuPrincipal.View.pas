unit MenuPrincipal.View;

interface

uses
    System.SysUtils,
    System.Classes,
    Vcl.Forms,
    Vcl.Controls,
    Vcl.StdCtrls,
    Vcl.ExtCtrls,
    Vcl.Dialogs,
    Login.Service,
    Usuario.Model,
    Session,
    MyEdit,
    MyLabel,
    Vcl.Menus,
    CadEmpresa.View,
    GerencialBase.View;

type
	TMenuPrincipalView = class(TForm)
    private
        MainMenu: TMainMenu;
        MenuCadastros: TMenuItem;
        MenuCadastroEmpresa: TMenuItem;
        MenuCadastroFilial: TMenuItem;
        MenuCadastroCliente: TMenuItem;
        MenuSair: TMenuItem;
        MenuTeste: TMenuItem;

        function CriaMenuItem(ACaption: String): TMenuItem;
        procedure MenuSairClick(Sender: TObject);
        procedure MenuCadastroEmpresaClick(Sender: TObject);
        procedure MenuTesteClick(Sender: TObject);
    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
	end;

implementation

constructor TMenuPrincipalView.Create(AOwner: TComponent);
begin
    inherited CreateNew(AOwner);
    // configura a tela
    Self.Caption := 'Menu Principal';
    Self.WindowState := wsMaximized;

    // adiciona os menus
    MainMenu := TMainMenu.Create(Self);

    // menu cadastros
    MenuCadastros := CriaMenuItem('Cadastros');
    MenuCadastroEmpresa := CriaMenuItem('Empresas');
    MenuCadastroEmpresa.OnClick := MenuCadastroEmpresaClick;
    MenuCadastroFilial := CriaMenuItem('Filiais');
    MenuCadastroCliente := CriaMenuItem('Clientes');

    MenuCadastros.Add(MenuCadastroEmpresa);
    MenuCadastros.Add(MenuCadastroFilial);
    MenuCadastros.Add(CriaMenuItem('-'));
    MenuCadastros.Add(MenuCadastroCliente);

    // menu sair
    MenuSair := CriaMenuItem('Sair');
    MenuSair.OnClick := MenuSairClick;

    MenuTeste := CriaMenuItem('Teste');
    MenuTeste.OnClick := MenuTesteClick;

    // adiciona os itens ao menu
    MainMenu.Items.Add(MenuCadastros);
    MainMenu.Items.Add(MenuSair);
    MainMenu.Items.Add(MenuTeste);

    Self.Menu := MainMenu;
end;

destructor TMenuPrincipalView.Destroy;
begin
    inherited Destroy;
end;

function TMenuPrincipalView.CriaMenuItem(ACaption: String): TMenuItem;
begin
  Result := TMenuItem.Create(MainMenu);
  Result.Caption := ACaption;
end;

procedure TMenuPrincipalView.MenuSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMenuPrincipalView.MenuCadastroEmpresaClick(Sender: TObject);
var
    LCadEmpresaView: TCadEmpresaView;
begin
    LCadEmpresaView := TCadEmpresaView.Create(nil);
    try
      LCadEmpresaView.ShowModal;
    finally
      FreeAndNil(LCadEmpresaView);
    end;
end;

procedure TMenuPrincipalView.MenuTesteClick(Sender: TObject);
var
    Teste: TGerencialBaseView;
begin
    Teste := TGerencialBaseView.Create(nil);
    try
        Teste.ShowModal;
    finally
        FreeAndNil(Teste);
    end;
end;

end.
