unit UnitWin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BReset: TButton;
    TextWinLose: TLabel;
    function BResetClick(Sender: TObject): boolean;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

function TForm2.BResetClick(): boolean;
begin
     BResetClick := True;
end;

end.

