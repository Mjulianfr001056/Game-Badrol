Uses crt;

Label
    Atas;

type
    pohon = array[0..5] of char; //Ini buat bikin pohon supaya tinggi maks nya 6

Var
    pilihan: integer;
    lagi: char;
    kebun : array[0..2] of pohon; //ini buat pohonnya yak

procedure buatKebun(idx : integer);
    var
        h, i: integer;
    begin
        h := 0;
        while h = 0 do h := random(7);

        for i := 0 to h do begin
            kebun[i,idx] := 'O';
        end;

        if(idx < 2) then buatKebun(idx + 1);
    end;

{* Ini program rekursif buat inisialisasi pohon yang akan dipakai
    untuk main, nah buat tiap kali main, udh ku set buat selalu
    manggil ini dulu sebelum main yakk. Jadi pas ntar main, pohonnya
    udah keisi secara random
*}

procedure tebangPohon(var pohon_ditebang : pohon; h : integer);
    var
        i,j: integer;
    begin
      for i:=5 downto 0 do
      begin
        if (pohon_ditebang[i]<>'O') then continue
        for j:=i downto i-h+1 do
        pohon_ditebang[j]:=' ';
        break;
      end;
    end;

{* Prosedur tebangPohon ini ngambil parameter pohon yang ditebang
    dan h sebagai jumlah yang ditebang. Tugasnya dia mengubah array
    pohon_ditebang menjadi ' ' (char kosong/cuma spasi) dari yang 
    awalnya 'o'. Nah ini bisa pake for sejumlah h kali yak. Selain
    itu, perlu diingat bahwa pohon ini ditebang dari bawah kan, nah
    jadi yang dikosongin duluan berarti yang atas,

    contoh:
    o                                      ' '
    o                                      ' '
    o           ditebang 2                  o
    o     -------------------->             o
    o                                       o
    o                                       o

    Jan lup ini cuma buat ngurangin pohon yak, tampil pohon ttp beda
    subprogram sendiri. Semangat~

*}
procedure tampilPohon();
    var
        a,x,y: integer;
        
    begin
       clrscr;
       gotoxy (35,1); writeln ('Kondisi Kebun Saat Ini');
       x:=35; y:=8;
       for a:=0 to 5 do
        begin
            gotoxy(x,y);
            writeln (kebun[a,0]);
            y:=y-1;
        end;
        gotoxy(35,9); writeln ('Pohon 1');

        x:=45; y:=8;
        for a:=0 to 5 do
        begin
            gotoxy(x,y);
            writeln (kebun[a,1]);
            y:=y-1;
        end;
        gotoxy(45,9); writeln ('Pohon 2');

        x:=55; y:= 8;
        for a:=0 to 5 do
        begin
            gotoxy(x,y);
            writeln (kebun[a,2]);
            y:=y-1;
        end;
        gotoxy(55,9); writeln ('Pohon 3');

        gotoxy (35,1); writeln;

    end;

{* Tampil pohon ini buat nampilkan kondisi pohon semuanya yak, bisa pake
    program yang udah dibuat, tpi disesuaikan lagi sama nama pohonnya di
    sini, di sini pohon 1, 2, 3 itu pakai kebun[0], kebun[1], sama kebun[3]. 
    Trus ditambah apabila pohon kosong, keluarkan (kosong) gini. Nah buat 
    ngeceknya bisa panggil fungsi cekPohon di bawah.
    Ini bagian Syifa.

*}

function cekPohon(p_di_cek : pohon) : boolean;
    var
        a : integer;
    begin
        for a:=5 downto 0 do
        begin
            if p_di_cek[a]='O' then cekPohon():=true
        end;
        
        else cekPohon():=false;

    end;

{* Cek pohon ini cuma ngecek apakah array di p_di_cek ini isinya kosong
    semua. Apabila iya, maka return true, apabila tidak, maka return false. 
    Buat ngeceknya bisa pake perulangan.
    Ini jatahnya Syifa juga yak.
*}


Procedure mainmudah;
    Label
        ulang_input_user;
        ulang_acak_pohon;
        ulang_acak_tinggi;

    var 
        ID_pohon, t_pohon : integer;   

    Begin
        clrscr;
        buatKebun(0);
        repeat
        tampilPohon();
        
        // input user
        ulang_input_user:
        write('Masukkan pohon yang akan Anda tebang = ');
        readln(ID_pohon);
        
        write('Masukkan jumlah pohon yang Anda tebang = ')
        readln(t_pohon);

        // cek kondisi bisa ditebang
        if (bisaDitebang(ID_pohon, t_pohon)) then
            tebangPohon(ID_pohon, t_pohon);
        else 
            goto ulang_input_user;

        // cek kondisi pohon
        if (cekPohon(0) and cekPohon(1) and cekPohon(2))then begin
            write('Selamat Anda telah memenangkan game ini');
            exit();
        end;
            
        // CPU
        tampilPohon();

        ulang_acak_pohon:
        ID_pohon:= random(3);
        
        ulang_acak_tinggi:
        t_pohon:= random(3);

        // cek bisaDitebang
        if (t_pohon=0) then
            goto ulang_acak_tinggi;
    
        if (not bisaDitebang(ID_pohon, t_pohon)) then
            goto ulang_acak_pohon;
        
        tebangPohon(ID_pohon, t_pohon);
       
            
        // cek kondisi pohon
        if (cekPohon(0)) and (cekPohon(1)) and (cekPohon(2)) then 
            write('Anda Kalah, Silakan Anda mencoba lagi');
            
        until (cekPohon(0) and cekPohon(1) and cekPohon(2));
    end;

Procedure mainsusah;
    Begin
        //forward;
    end;

Begin
    Atas:
    randomize; // jangan dihapus

    clrscr;
    gotoxy(15,2);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
    gotoxy(15,3);writeln('= = =                       WELCOME TO                          =');
    gotoxy(15,4);writeln('= =                                                           = =');
    gotoxy(15,5);writeln('=               TEBANG POHON BERSAMA BADROL & SAM           = = =');
    gotoxy(15,6);writeln('= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =');
    gotoxy(46,7);writeln('= =');
    gotoxy(46,8);writeln('= =');
    gotoxy(35,9) ;writeln('= = = = = = = = = = = = =');
    gotoxy(35,10);writeln('=      PILIH LEVEL      =');
    gotoxy(35,11);writeln('=                       =');   
    gotoxy(35,12);writeln('=    1. MAIN SUSAH      =');    
    gotoxy(35,13);writeln('=    2. MAIN MUDAH      =');
    gotoxy(35,14);writeln('=    3. KELUAR          =');
    gotoxy(35,15);writeln('= = = = = = = = = = = = =');
    gotoxy(40,17);write  ('LEVEL ANDA : '); readln(pilihan);
    
    case pilihan of
        1:  Begin
            mainsusah;
            end;
        2:  Begin
            mainmudah;
            end;
        3:  Exit;
    else 
        begin
            gotoxy(40,19);writeln('PILIHAN ANDA SALAH');
            gotoxy(35,20);write('INGIN MENCOBA LAGI? (Y/T) : ');readln(lagi);
            If (lagi='Y') or (lagi='y') then
            GoTo Atas;
        end;
    end;

    //BTW, klo diliat, ini kebalik if-case nya, jadi ntar bikin pull request yang udh
    //diperbaiki yakk, ini buat Sani jugaa. Sama bisa dibuat pilihan apabila pemain salah 
    //memasukkan angka. Trus bikin juga pilihan untuk keluar, bisa pake Case-of supaya
    //lebih teratur yaakk. Semangat~
End.
