unit UnitGame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BTebang1: TButton;
    BTebang2: TButton;
    Label1: TLabel;
    NPohon_1: TLabel;
    NPohon_2: TLabel;
    NPohon_3: TLabel;
    RDB_1: TRadioButton;
    RDB_2: TRadioButton;
    RDB_3: TRadioButton;
    RadioGroup1: TRadioGroup;
    Stack1_1: TShape;
    Stack1_2: TShape;
    Stack1_3: TShape;
    Stack1_4: TShape;
    Stack1_5: TShape;
    Stack1_6: TShape;
    Stack2_1: TShape;
    Stack2_2: TShape;
    Stack2_3: TShape;
    Stack2_4: TShape;
    Stack2_5: TShape;
    Stack2_6: TShape;
    Stack3_1: TShape;
    Stack3_2: TShape;
    Stack3_3: TShape;
    Stack3_4: TShape;
    Stack3_5: TShape;
    Stack3_6: TShape;
    procedure BTebang1Click(Sender: TObject);
    procedure BTebang2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure NPohon_2Click(Sender: TObject);
  private

  public

  end;

type
    Tpohon = array[0..10] of Tshape;

var
    Form1: TForm1;
    pohon1, pohon2, pohon3: Tpohon;
    TinggiPohon: array[0..5] of integer;
    createdForm : boolean;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.NPohon_2Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var
    tmpTinggi, i : integer;

begin
     randomize;

     if not createdForm then begin
         tmpTinggi := 0;
         //Create tree 1st
         pohon1[1] := stack1_1;
         pohon1[2] := stack1_2;
         pohon1[3] := stack1_3;
         pohon1[4] := stack1_4;
         pohon1[5] := stack1_5;
         pohon1[6] := stack1_6;

         repeat
             tmpTinggi := random(7);
         until tmpTinggi <> 0;

         TinggiPohon[1] := tmpTinggi;

         for i := 1 to tmpTinggi do begin
             pohon1[i].Show;
         end;

         tmpTinggi := 0;
         //Create tree 2nd

         pohon2[1] := stack2_1;
         pohon2[2] := stack2_2;
         pohon2[3] := stack2_3;
         pohon2[4] := stack2_4;
         pohon2[5] := stack2_5;
         pohon2[6] := stack2_6;

         repeat
             tmpTinggi := random(7);
         until tmpTinggi <> 0;

         TinggiPohon[2] := tmpTinggi;

         for i := 1 to tmpTinggi do begin
             pohon2[i].Show;
         end;

         tmpTinggi := 0;
         //Create tree 3rd
         pohon3[1] := stack3_1;
         pohon3[2] := stack3_2;
         pohon3[3] := stack3_3;
         pohon3[4] := stack3_4;
         pohon3[5] := stack3_5;
         pohon3[6] := stack3_6;

         repeat
             tmpTinggi := random(7);
         until tmpTinggi <> 0;

         TinggiPohon[3] := tmpTinggi;

         for i := 1 to tmpTinggi do begin
             pohon3[i].Show;
         end;
         CreatedForm:= True;
     end;
end;

procedure TForm1.BTebang1Click(Sender: TObject);
var
    ID_pohon, t_pohon : integer;
    tmp_str : string;
    userDone : boolean;

function cutAble(ID_pohon, h : integer) : boolean;
    var
        isAble_flag : boolean;
    begin
        isAble_flag := false;

        if (ID_pohon = 1) and (h <= tinggiPohon[1])
        then isAble_flag := True;

        if (ID_pohon = 2) and (h <= tinggiPohon[2])
        then isAble_flag := True;

        if (ID_pohon = 3) and (h <= tinggiPohon[3])
        then isAble_flag := True;

        cutAble := isAble_flag or False;
    end;

procedure cutTree(ID_pohon, h : integer);
var
    tmp_h, i : integer;
begin
    tmp_h := tinggiPohon[ID_pohon];

    tinggiPohon[ID_pohon] -= h;

    for i := 1 to h do begin
       if (ID_pohon = 1) then pohon1[tmp_h].Hide;
       if (ID_pohon = 2) then pohon2[tmp_h].Hide;
       if (ID_pohon = 3) then pohon3[tmp_h].Hide;

       dec(tmp_h);
    end;
end;

function winCheck() : boolean;
begin
    if (tinggiPohon[1] = 0) and (tinggiPohon[2] = 0) and (tinggiPohon[3] = 0)
    then winCheck := True else winCheck := False;
end;

begin
    userDone := False;
    ID_pohon := 0;
    if RDB_1.Checked then ID_pohon := 1;
    if RDB_2.Checked then ID_pohon := 2;
    if RDB_3.Checked then ID_pohon := 3;

    if cutAble(ID_pohon, 1) then begin
        cutTree(ID_pohon, 1);
        tmp_str := concat('Berhasil menebang pohon ', intToStr(ID_Pohon));
        ShowMessage(tmp_str);
        userDone := true;
    end else begin
        ShowMessage('Pohon tidak bisa ditebang!');
    end;

    ID_pohon := 0;
    t_pohon := 0;

    if ( ( not winCheck() ) and userDone) then begin
       repeat
             ID_pohon := random(4);
             t_pohon := random(3);
       until cutAble(ID_pohon, t_pohon) and (ID_pohon > 0) and (t_pohon > 0);

       tmp_str := concat('Komputer menebang pohon ', intToStr(ID_Pohon));
       ShowMessage(tmp_str);

       cutTree(ID_pohon, t_pohon);

       if(winCheck()) then begin
           //kondisi komputer menang;
           showMessage('Anda Kalah');
           BTebang1.Enabled:=False;
           BTebang2.Enabled:=False;
           RadioGroup1.Enabled:=False;
       end;
    end else if winCheck() then begin
        //Kondisi user menang;
        showMessage('Anda Menang');
        BTebang1.Enabled:=False;
        BTebang2.Enabled:=False;
        RadioGroup1.Enabled:=False;
    end;
end;

procedure TForm1.BTebang2Click(Sender: TObject);
var
    ID_pohon, t_pohon : integer;
    tmp_str : string;
    userDone : boolean;

function cutAble(ID_pohon, h : integer) : boolean;
    var
        isAble_flag : boolean;
    begin
        isAble_flag := false;

        if (ID_pohon = 1) and (h <= tinggiPohon[1])
        then isAble_flag := True;

        if (ID_pohon = 2) and (h <= tinggiPohon[2])
        then isAble_flag := True;

        if (ID_pohon = 3) and (h <= tinggiPohon[3])
        then isAble_flag := True;

        cutAble := isAble_flag or False;
    end;

procedure cutTree(ID_pohon, h : integer);
var
    tmp_h, i : integer;
begin
    tmp_h := tinggiPohon[ID_pohon];

    tinggiPohon[ID_pohon] -= h;

    for i := 1 to h do begin
       if (ID_pohon = 1) then pohon1[tmp_h].Hide;
       if (ID_pohon = 2) then pohon2[tmp_h].Hide;
       if (ID_pohon = 3) then pohon3[tmp_h].Hide;

       dec(tmp_h);
    end;
end;

function winCheck() : boolean;
begin
    if (tinggiPohon[1] = 0) and (tinggiPohon[2] = 0) and (tinggiPohon[3] = 0)
    then winCheck := True else winCheck := False;
end;

begin
    userDone := False;
    ID_pohon := 0;
    if RDB_1.Checked then ID_pohon := 1;
    if RDB_2.Checked then ID_pohon := 2;
    if RDB_3.Checked then ID_pohon := 3;

    if cutAble(ID_pohon, 2) then begin
        cutTree(ID_pohon, 2);
        tmp_str := concat('Berhasil menebang pohon ', intToStr(ID_Pohon));
        ShowMessage(tmp_str);
        userDone := true;
    end else begin
        ShowMessage('Pohon tidak bisa ditebang!');
    end;

    ID_pohon := 0;
    t_pohon := 0;

    if ( ( not winCheck() ) and userDone) then begin
       repeat
             ID_pohon := random(4);
             t_pohon := random(3);
       until cutAble(ID_pohon, t_pohon) and (ID_pohon > 0) and (t_pohon > 0);

       tmp_str := concat('Komputer menebang pohon ', intToStr(ID_Pohon));
       ShowMessage(tmp_str);

       cutTree(ID_pohon, t_pohon);

       if(winCheck()) then begin
           //kondisi komputer menang;
           showMessage('Anda Kalah');
           BTebang1.Enabled:=False;
           BTebang2.Enabled:=False;
           RadioGroup1.Enabled:=False;
       end;
    end else if winCheck() then begin
        //Kondisi user menang;
        showMessage('Anda Menang');
        BTebang1.Enabled:=False;
        BTebang2.Enabled:=False;
        RadioGroup1.Enabled:=False;
    end;
end;

end.

