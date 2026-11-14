unit MyComboBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls;

type
  TMyComboBox = class(TComboBox)
  private
    FValues: TStringList;
    function GetValues: TStrings;
    procedure SetValues(const Value: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Value: String;
  published
    property Values: TStrings read GetValues write SetValues;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MyComponents', [TMyComboBox]);
end;

constructor TMyComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Font.Name := 'Arial';
  Font.Size := 10;
  CharCase := ecUpperCase;
  FValues := TStringList.Create;
  Style := csDropDownList;
end;

destructor TMyComboBox.Destroy;
begin
  FValues.Free;
  inherited;
end;

function TMyComboBox.GetValues: TStrings;
begin
  Result := FValues;
end;

procedure TMyComboBox.SetValues(const Value: TStrings);
begin
  FValues.Assign(Value);
end;

function TMyComboBox.Value: String;
begin
  Result := Values[Items.IndexOf(Text)];
end;

end.
