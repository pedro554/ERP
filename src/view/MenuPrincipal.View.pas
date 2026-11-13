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
    Vcl.Menus;

type
	TMenuPrincipalView = class(TForm)
    private
        MainMenu: TMainMenu;
        MenuCadastros: TMenuItem;

        function CriaMenuItem(ACaption: String): TMenuItem;
    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
	end;

implementation

constructor TMenuPrincipalView.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);
  Self.Caption := 'Menu Principal';
  Self.WindowState := wsMaximized;

  MainMenu := TMainMenu.Create(Self);
  
  MenuCadastros := CriaMenuItem('Cadastros');

  MainMenu.Items.Add(MenuCadastros);

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

end.
