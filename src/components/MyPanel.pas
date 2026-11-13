unit MyPanel;

interface

uses
	System.SysUtils, 
    System.Classes, 
    Vcl.Controls, 
    Vcl.ExtCtrls;

type
	TMyPanel = class(TPanel)
    public
        constructor Create(AOwner: TComponent); override;
	end;

procedure Register;

implementation

procedure Register;
begin
	RegisterComponents('My Components', [TMyPanel]);
end;

constructor TMyPanel.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    Self.Caption := '';
end;

end.
