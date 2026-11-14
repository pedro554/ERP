unit CadEmpresa.View;

interface

uses
	Vcl.Forms, MyLabel, MyCheckBox, MyEdit, MyMemo, System.SysUtils, System.Classes,
    MyPanel, Vcl.Controls, MyButton, Empresa.Service, Empresa.Model, Firedac.Comp.Client, 
    Firedac.Stan.Def, Firedac.Stan.Async, Firedac.DApt, Firedac.Phys.FB, Firedac.Phys.FBDef,
    Firedac.Phys, Firedac.Stan.Intf, Firedac.Stan.Option, Firedac.Stan.Error, Firedac.UI.Intf, 
    Firedac.VCLUI.Wait, Firedac.Comp.UI, Conexao;

type
	TCadEmpresaView = class(TForm)
    private
        lblNome: TMyLabel;
        edtNome: TMyEdit;
        chkAtivo: TMyCheckBox;
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
    Self.Height := 200;
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
var
    Empresa: TEmpresaModel;
    Service: TEmpresaService;
    Conn: TFDConnection;
begin
    Conn := TConexao.Conexao(nil);
    Empresa := TEmpresaModel.Create;
    Service := TEmpresaService.Create(Conn);
    try
        Empresa.Codigo := 1; // pegar da sequencia
        Empresa.Nome := edtNome.Text;
        Empresa.Ativo := chkAtivo.Checked;

        Conn.Transaction.StartTransaction;
        try
            Service.Gravar(Empresa);
            Conn.Transaction.Commit;
            ModalResult := mrOk;
        except
          on E: Exception do
          begin
            Conn.Transaction.Rollback;
            raise Exception.Create('Falha ao gravar empresa: ' + e.Message);
          end;
        end;
    finally
        FreeAndNil(Empresa);
        FreeAndNil(Service);
        FreeAndNil(Conn);
    end;
end;

end.
