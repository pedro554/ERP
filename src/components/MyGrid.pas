unit MyGrid;

interface

uses
	Vcl.Grids,
	System.Classes,
	Vcl.StdCtrls;

type
	TMyGrid = class(TStringGrid)
    public
        constructor Create(AOwner: TComponent); override;
	end;

procedure Register;

implementation

procedure Register;
begin
	RegisterComponents('My Components', [TMyGrid]);
end;

constructor TMyGrid.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);
    Self.Font.Name := 'Arial';
    Self.Font.Size := 10;
end;

end.
