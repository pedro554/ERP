unit MyGrid;

interface

uses
	Vcl.Grids,
	System.Classes,
	Vcl.StdCtrls,
	System.SysUtils;

type
	TMyGrid = class(TStringGrid)
    public
        constructor Create(AOwner: TComponent); override;
		function TemRegistroSelecionado: Boolean;
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
	FixedCols := 0;
	FixedRows := 0;
	ColCount := 1;
	RowCount := 1;
	Cells[0, 0] := '';
end;

function TMyGrid.TemRegistroSelecionado: Boolean;
begin
  Result := (Row >= FixedRows) and 
			(Row < RowCount) and
			(Trim(Cells[0, Row]) <> ''); 
end;

end.
