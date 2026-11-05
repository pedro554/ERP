unit MyEdit;

interface

uses
	System.Classes,
	Vcl.StdCtrls;

type
	TMyEdit = class(TEdit)
    public
        constructor Create(AOwner: TComponent); override;
	end;

procedure Register;

implementation

procedure Register;
begin
	RegisterComponents('My Components', [TMyEdit]);
end;

constructor TMyEdit.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    Self.font.Name := 'Arial';
    Self.font.Size := 10;
    Self.CharCase := ecUpperCase;
end;

end.
