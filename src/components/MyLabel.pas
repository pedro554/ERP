unit MyLabel;

interface

uses
	Vcl.StdCtrls,
    System.Classes;

type
	TMyLabel = class(TLabel)
    public
        constructor Create(AOwner: TComponent); override;
	end;

procedure Register;

implementation

procedure Register;
begin
	RegisterComponents('My Components', [TMyLabel]);
end;

constructor TMyLabel.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    Self.font.Name := 'Arial';
    Self.font.Size := 10;
end;

end.
