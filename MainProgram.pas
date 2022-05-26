Uses crt;

Label
    Atas;

type
    pohon = array[0..5] of char; //Ini buat bikin pohon supaya tinggi maks nya 6

Var
    pilihan : integer;
    kebun : array[0..2] of pohon; //ini buat pohonnya yak

procedure buatKebun(idx : integer);
    var
        h, i: integer;
    begin
        h := 0;
        while h = 0 do h := random(7);

        for i := 0 to h do begin
            kebun[idx] := 'o';
        end;

        if(idx < 2) then buatKebun(idx + 1);
    end;

{* Ini program rekursif buat inisialisasi pohon yang akan dipakai
    untuk main, nah buat tiap kali main, udh ku set buat selalu
    manggil ini dulu sebelum main yakk. Jadi pas ntar main, pohonnya
    udah keisi secara random
*}

procedure tebangPohon(var pohon_ditebang : pohon; h : integer);
    begin
        //forward;
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
    begin
        //forward;
    end;

{* Tampil pohon ini buat nampilkan kondisi pohon semuanya yak, bisa pake
    program yang udah dibuat, tpi disesuaikan lagi sama nama pohonnya di
    sini, di sini pohon 1, 2, 3 itu pakai kebun[0], kebun[1], sama kebun[3]. 
    Trus ditambah apabila pohon kosong, keluarkan (kosong) gini. Nah buat 
    ngeceknya bisa panggil fungsi cekPohon di bawah.
    Ini bagian Syifa.

*}

function cekPohon(p_di_cek : pohon) : boolean;
    begin
        //forward;
    end;

{* Cek pohon ini cuma ngecek apakah array di p_di_cek ini isinya kosong
    semua. Apabila iya, maka return true, apabila tidak, maka return false. 
    Buat ngeceknya bisa pake perulangan.
    Ini jatahnya Syifa juga yak.
*}


Procedure mainmudah;
    Begin
        buatKebun(0);
    end;

{* Main mudah ini buat main sama CPU yang tebang pohon secara random.
    Perlu diperhatikan bahwa sebelum tebang pohon secara random, pastikan
    pohon yang ditebang itu tidak kosong. Hal ini bisa diperoleh dengan
    memanggil fungsi cekPohon dengan parameter pohon yang mau di-cek

    Untuk main secara gantian-gantian, bisa dibuat pakai repeat-until 
    atau while-do, jadi ntar di main mudah bisa bikin perulangannya. 
    Buat tebang pohon, bisa panggil subprogram dibawah yak. Yang ini 
    jatahnya Agress yak.

    Tolong bikin subprogram buat tebang pohon yak, parameternya pohon 
    yang mau ditebang, sma berapa banyak yang mau ditebang. Ini aku mintol
    ke Sani. 

*}

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
    gotoxy(35,14);writeln('= = = = = = = = = = = = =');
    gotoxy(40,16);write  ('LEVEL ANDA : '); readln(pilihan);
    
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
