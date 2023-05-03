unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TStopWatch }

  TStopWatch = class(TForm)
    BitBtnExit: TBitBtn;
    ButtonStart: TButton;
    ButtonStop: TButton;
    ButtonContinue: TButton;
    Time: TLabel;
    Dio: TStaticText;
    Timer: TTimer;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonContinueClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private

  public

  end;

var
  StopWatch: TStopWatch;
  Start : Double;
  b: Boolean;
  ZaWarka: TDateTime;



implementation

{$R *.lfm}

function GetTime: TDateTime;
  var s : TSystemTime;
  begin
    GetLocalTime(s);
    Result := SystemTimeToDateTime(s);
end;

procedure TStopWatch.ButtonStartClick(Sender: TObject);
begin
  b:= False;
  Dio.Caption:='';
  Timer.Enabled := True;
  ZaWarka:=0;
  ButtonContinue.Visible:=False;
end;

procedure TStopWatch.ButtonStopClick(Sender: TObject);
begin
  Timer.Enabled := False;
  Dio.Caption:='Время остановило движение';
  ZaWarka:=GetTime-Start+ZaWarka;
  ButtonContinue.Visible:=True;
end;

procedure TStopWatch.ButtonContinueClick(Sender: TObject);
begin
  b:= False;
  Dio.Caption:='';
  Timer.Enabled := True;
  ButtonContinue.Visible:=False;
end;


procedure TStopWatch.TimerTimer(Sender: TObject);
begin

  if not (b) then
  Start := GetTime;

  b:= True;



  Time.Caption := FormatDateTime('hh:nn:ss zzz', GetTime - Start + ZaWarka)


end;
end.

