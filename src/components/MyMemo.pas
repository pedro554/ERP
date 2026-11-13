unit MyMemo;

interface

uses
	System.Classes,
	Vcl.StdCtrls;

type
	TMyMemo = class(TMemo)
    public
        constructor Create(AOwner: TComponent); override;
	end;

procedure Register;

implementation

procedure Register;
begin
	RegisterComponents('My Components', [TMyMemo]);
end;

constructor TMyMemo.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    Self.font.Name := 'Arial';
    Self.font.Size := 10;
    Self.CharCase := ecUpperCase;
end;

end.
