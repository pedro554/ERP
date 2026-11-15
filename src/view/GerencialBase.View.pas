unit GerencialBase.View;

interface

uses
	System.Classes,
	Vcl.Forms,
    MyPanel,
    MyEdit,
    MyButton,
    MyLabel,
    Vcl.Controls,
    Constantes,
    MyComboBox,
    MyGrid,
    System.SysUtils;

type
	TGerencialBaseView = class(TForm)
	private
        pnlFiltro: TMyPanel;
        lblFiltro: TMyLabel;
        edtFiltro: TMyEdit;
        lblColuna: TMyLabel;
        cbbColuna: TMyComboBox;
        btnFiltrar: TMyButton;
        gridFiltro: TMyGrid;
        pnlBotoes: TMyPanel;
        btnSelecionar: TMyButton;
        btnCancelar: TMyButton;

        procedure Cancelar(Sender: TObject);
        procedure Selecionar(Sender: TObject);
	public
		constructor Create(AOwner: TComponent); override;
	end;

implementation

constructor TGerencialBaseView.Create(AOwner: TComponent);
begin
	inherited CreateNew(AOwner);
    Self.Height := 600;
    Self.Width := 800;
    Self.Position := poScreenCenter;
    
    pnlFiltro := TMyPanel.Create(Self);
    pnlFiltro.Parent := Self;
    pnlFiltro.Align := alTop;
    pnlFiltro.Height := 120;

    lblFiltro := TMyLabel.Create(pnlFiltro);
    lblFiltro.Parent := pnlFiltro;
    lblFiltro.Caption := 'Texto filtro';
    lblFiltro.SetBounds(10, 10, 250, C_LABEL_HEIGHT);

    edtFiltro := TMyEdit.Create(pnlFiltro);
    edtFiltro.Parent := pnlFiltro;
    edtFiltro.SetBounds(lblFiltro.Left, lblFiltro.Top + 21, lblFiltro.Width, C_EDIT_HEIGHT);

    btnFiltrar := TMyButton.Create(pnlFiltro);
    btnFiltrar.Parent := pnlFiltro;
    btnFiltrar.Caption := 'Filtrar';
    btnFiltrar.SetBounds(edtFiltro.Left + edtFiltro.Width + 5, edtFiltro.Top, 120, C_BUTTON_HEIGHT);

    lblColuna := TMyLabel.Create(pnlFiltro);
    lblColuna.Parent := pnlFiltro;
    lblColuna.Caption := 'Coluna Filtro';
    lblColuna.SetBounds(10, edtFiltro.Top + 30, 250, C_LABEL_HEIGHT);

    cbbColuna := TMyComboBox.Create(pnlFiltro);
    cbbColuna.Parent := pnlFiltro;
    cbbColuna.SetBounds(lblColuna.Left, lblColuna.Top + 21, lblColuna.Width, C_EDIT_HEIGHT);

    gridFiltro := TMyGrid.Create(Self);
    gridFiltro.Parent := Self;
    gridFiltro.Align := alClient;

    pnlBotoes := TMyPanel.Create(Self);
    pnlBotoes.Parent := Self;
    pnlBotoes.Align := alBottom;
    pnlBotoes.Height := 50;

    btnCancelar := TMyButton.Create(pnlBotoes);
    btnCancelar.Parent := pnlBotoes;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.SetBounds(10, 10, 120, C_BUTTON_HEIGHT);
    btnCancelar.OnClick := Cancelar;

    btnSelecionar := TMyButton.Create(pnlBotoes);
    btnSelecionar.Parent := pnlBotoes;
    btnSelecionar.Caption := 'Selecionar';
    btnSelecionar.SetBounds(btnCancelar.Left + btnCancelar.Width + 5, 10, 120, C_BUTTON_HEIGHT);
    btnSelecionar.OnClick := Selecionar;
end;

procedure TGerencialBaseView.Cancelar(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TGerencialBaseView.Selecionar(Sender: TObject);
begin
    if not gridFiltro.TemRegistroSelecionado then
      raise Exception.Create('Selecione pelo menos 1 registros.');

    ModalResult := mrOk;
end;

end.
