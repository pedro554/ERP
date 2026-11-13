unit CadEmpresa.View;

interface

uses
	Vcl.Forms, MyLabel, MyCheckBox, MyEdit, MyMemo, System.SysUtils, System.Classes,
    MyPanel, Vcl.Controls, MyButton;

type
	TCadEmpresaView = class(TForm)
    private
        lblNome: TMyLabel;
        edtNome: TMyEdit;
        chkAtivo: TMyCheckBox;
        lblObs: TMyLabel;
        memObs: TMyMemo;
        pnlBotoes: TMyPanel;
        btnCancelar: TMyButton;
        btnGravar: TMyButton;

        procedure Cancelar(Sender: TObject);
        procedure Gravar(Sender: TObject);
    public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
    end;

implementation

constructor TCadEmpresaView.Create(AOwner: TComponent);
begin
    inherited CreateNew(AOwner);
    Self.Caption := 'Cadastro da Empresa';
    Self.Width := 550; 
    Self.Height := 300;
    Self.Position := poScreenCenter;

    lblNome := TMyLabel.Create(Self);
    lblNome.Top := 10;
    lblNome.Left := 10;
    lblNome.Caption := 'Nome';
    lblNome.Parent := Self;

    edtNome := TMyEdit.Create(Self);
    edtNome.Top := lblNome.Top + 20;
    edtNome.Left := lblNome.Left;
    edtNome.Parent := Self;
    edtNome.Width := 250;

    chkAtivo := TMyCheckBox.Create(Self);
    chkAtivo.Top := edtNome.Top + 30;
    chkAtivo.Left := lblNome.Left;
    chkAtivo.Caption := 'Ativo';
    chkAtivo.Parent := Self;

    lblObs := TMyLabel.Create(Self);
    lblObs.Top := 80;
    lblObs.Left := lblNome.Left;
    lblObs.Caption := 'Observação';
    lblObs.Parent := Self;

    memObs := TMyMemo.Create(Self);
    memObs.Top := lblObs.Top + 20;
    memObs.Left := lblObs.Left;
    memObs.Parent := Self;
    memObs.Width := 500;

    pnlBotoes := TMyPanel.Create(Self);
    pnlBotoes.Parent := Self;
    pnlBotoes.Align := alBottom;

    btnCancelar := TMyButton.Create(Self);
    btnCancelar.Parent := pnlBotoes;
    btnCancelar.Top := 10;
    btnCancelar.Left := 10;
    btnCancelar.Caption := 'Cancelar';
    btnCancelar.OnClick := Self.Cancelar;

    btnGravar := TMyButton.Create(Self);
    btnGravar.Parent := pnlBotoes;
    btnGravar.Top := 10;
    btnGravar.Left := 100;
    btnGravar.Caption := 'Gravar';
    btnGravar.OnClick := Self.Gravar;
end;

destructor TCadEmpresaView.Destroy;
begin
    inherited Destroy;
end;

procedure TCadEmpresaView.Cancelar(Sender: TObject);
begin
    Self.ModalResult := mrCancel;
end;

procedure TCadEmpresaView.Gravar(Sender: TObject);
begin
  
end;

end.
