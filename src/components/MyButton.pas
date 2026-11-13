unit MyButton;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls;

type
  TMyButton = class(TButton)
  public
    constructor Create(AOwner: TComponent); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MyComponents', [TMyButton]);
end;

constructor TMyButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Cursor := crHandPoint;
  TabStop := False;
  Font.Name := 'Arial';
  Font.Size := 10;
end;

initialization
    RegisterClass(TMyButton);
finalization
    UnRegisterClass(TMyButton);

end.