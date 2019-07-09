unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    redOut: TRichEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  iNum, iNew, iOdd, iCount : integer;
begin
  iNum := StrToInt(InputBox('Enter','n','413'));
  iNew := iNum;
  iOdd := 0;
  iCount := 1;
  redOut.Lines.Clear;
  redOut.Lines.Add('Sequence of: '+IntToStr(iNum)+#10);

  while iNew > 1 do
  begin
    redOut.Lines.Add(IntToStr(iCount)+': '+IntToStr(iNew));
    Inc(iCount);
    if Odd(iNew) then
    begin
      Inc(iOdd);
      iNew := 3*iNew+1;
    end//if Odd
    else
      iNew := iNew div 2;
  end;//while still running

  redOut.Lines.Add(IntToStr(iCount)+': 1');

  redOut.Lines.Add(#10+'Summary'+#10);
  redOut.Lines.Add('Original number: '+IntToStr(iNum));
  redOut.Lines.Add('Iterations: '+IntToStr(iCount));
  redOut.Lines.Add('Odd iterations: '+IntToStr(iOdd));
  redOut.Lines.Add('Even iterations: '+IntToStr(iCount-iOdd));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  iSteps, iNew, iCount : integer;
begin
  iSteps := StrToInt(InputBox('Enter','Iterations','90'));
  iNew := 1;
  iCount := 1; //1610612736
  redOut.Lines.Clear;
  redOut.Lines.Add('Reverse sequence of: '+IntToStr(iSteps)+' iterations'+#10);

  repeat
    redOut.Lines.Add(IntToStr(iCount)+': '+IntToStr(iNew));
    Inc(iCount);
    if (((iNew-1) mod 3 = 0) and Odd((iNew-1) div 3)) and ((iNew*2)-1 mod 3 <> 0) then
      iNew := (iNew-1) div 3
    else
      iNew := iNew*2;
  until (iCount = iSteps);
end;

end.
