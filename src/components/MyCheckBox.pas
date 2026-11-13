unit MyCheckbox;

interface

uses
	System.Classes,
	Vcl.StdCtrls;

type
	TMyCheckBox = class(TCheckBox)
    public
        constructor Create(AOwner: TComponent); override;
	end;

procedure Register;

implementation

procedure Register;
begin
	RegisterComponents('My Components', [TMyCheckBox]);
end;

constructor TMyCheckBox.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    Self.font.Name := 'Arial';
    Self.font.Size := 10;
    Self.TabStop := False;
end;

end.
