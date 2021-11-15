#!/bin/bash

#author: Mateusz Cierniak
#created: 15.11.2021 

wygrana=0;
remis=0;
wyborgracza1=pole;
wyborgracza2=pole;

pole=(_ _ _
      _ _ _
      _ _ _);
      
echo "Witamy w grze kółko-krzyżyk. Wybór pola na którym ma być postawione kółko lub krzyżyk polega na wpisaniu cyfry pola na którym chcemy je postawić. Pola ponumerowane są w następujący sposób:
0|1|2
3|4|5
6|7|8
------------------------------------
Zaczynamy grę:";


function rysujpole {
 echo "
 ---------------------------------------------------------------
 Twoje pole: ${pole[0]}|${pole[1]}|${pole[2]}    Pola gry: 0|1|2 
             ${pole[3]}|${pole[4]}|${pole[5]}              3|4|5 
             ${pole[6]}|${pole[7]}|${pole[8]}              6|7|8 
 ----------------------------------------------------------------";
}


function gracz1 {
 echo "Gracz1: gdzie chcesz postawic krzyzyk:";
 
 read wyborgracza1;
  if [ $wyborgracza1 -lt 0 ]  || [ $wyborgracza1 -gt 8 ]
  then
   echo "Podana liczba wykracza poza zakres pola gry. Wybierz jeszcze raz pole od 0 do 9";
   wyborgracza1=pole;
  elif [ $wyborgracza1 -ge 0 ]  || [ $wyborgracza1 -le 8 ]
  then 
   if [ ${pole[$wyborgracza1]} == _ ]
   then
    pole[$wyborgracza1]=x;
   else
    echo "To pole jest już zajete. Sprobuj ponownie";
   fi
  else
   echo "Podano litere lub nieprawidlowa wartosc pola gry. Wybierz jeszcze raz pole od 0 do 9";
   wyborgracza1=pole;
  fi 
}

function gracz2 {
 echo "Gracz2: gdzie chcesz postawic kolko:";
 
 read wyborgracza2;
  if [ $wyborgracza2 -lt 0 ]  || [ $wyborgracza2 -gt 8 ]
  then
   echo "Podana liczba wykracza poza zakres pola gry. Wybierz jeszcze raz pole od 0 do 9";
   wyborgracza2=pole;
  elif [ $wyborgracza2 -ge 0 ]  || [ $wyborgracza2 -le 8 ]
  then 
   if [ ${pole[$wyborgracza2]} == _ ]
   then
    pole[$wyborgracza2]=o;
   else
    echo "To pole jest już zajete. Sprobuj ponownie";
   fi
  else
   echo "Podano litere lub nieprawidlowa wartosc pola gry. Wybierz jeszcze raz pole od 0 do 9";
   wyborgracza2=pole;
  fi 
}

#-------------------------funkcje sprawdzajace wygrana-------------------------------

function sprawdz_wygrana_gracz1 {
 if  [ ${pole[0]} == x ] && [ ${pole[1]} == x ] && [ ${pole[2]} == x ]  
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 1";
 elif [ ${pole[1]} == x ] && [ ${pole[4]} == x ] && [ ${pole[7]} == x ]
 then
  wygrana=1; 
  echo "Brawo wygrywa gracz 1";
 elif [ ${pole[0]} == x ] && [ ${pole[3]} == x ] && [ ${pole[6]} == x ]
 then
  wygrana=1; 
  echo "Brawo wygrywa gracz 1";
 elif [ ${pole[6]} == x ] && [ ${pole[7]} == x ] && [ ${pole[8]} == x ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 1";
 elif [ ${pole[2]} == x ] && [ ${pole[5]} == x ] && [ ${pole[8]} == x ]
 then
  wygrana=1; 
  echo "Brawo wygrywa gracz 1";
 elif [ ${pole[0]} == x ] && [ ${pole[4]} == x ] && [ ${pole[8]} == x ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 1";
 elif [ ${pole[2]} == x ] && [ ${pole[4]} == x ] && [ ${pole[6]} == x ]
 then
  wygrana=1; 
  echo "Brawo wygrywa gracz 1";
 elif [ $wygrana -eq 1 ]
 then 
  echo "Koniec gry. Przegraleś wygrywa gracz 2";
 else 
  echo "
  Gramy dalej";
 fi
}

function sprawdz_wygrana_gracz2 {
 if  [ ${pole[0]} == o ] && [ ${pole[1]} == o ] && [ ${pole[2]} == o ]  
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 2";
 elif [ ${pole[1]} == o ] && [ ${pole[4]} == o ] && [ ${pole[7]} == o ]
 then
  wygrana=1; 
  echo "Brawo wygrywa gracz 2";
 elif [ ${pole[0]} == o ] && [ ${pole[3]} == o ] && [ ${pole[6]} == o ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 2";
 elif [ ${pole[6]} == o ] && [ ${pole[7]} == o ] && [ ${pole[8]} == o ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 2";
 elif [ ${pole[2]} == o ] && [ ${pole[5]} == o ] && [ ${pole[8]} == o ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 2";
 elif [ ${pole[0]} == o ] && [ ${pole[4]} == o ] && [ ${pole[8]} == o ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 2";
 elif [ ${pole[2]} == o ] && [ ${pole[4]} == o ] && [ ${pole[6]} == o ]
 then 
  wygrana=1;
  echo "Brawo wygrywa gracz 2";
 elif [ $wygrana -eq 1 ]
 then 
  echo "Koniec gry. Przegraleś wygrywa gracz 1";
 else 
  echo "
  Gramy dalej";
 fi
}

function sprawdz_remis {
 if [ ${pole[0]} != _ ] && [ ${pole[1]} != _ ] && [ ${pole[2]} != _ ] && [ ${pole[3]} != _ ] && [ ${pole[4]} != _ ] && [ ${pole[5]} != _ ] &&[  ${pole[6]} != _ ] && [ ${pole[7]} != _ ] && [ ${pole[8]} != _ ] && [ $wygrana -eq 0 ]
 then
  wygrana=1;
  echo "Remis";
 else
  echo "";
 fi
}

#---------------------------------gra--------------------------------------------------

rysujpole;

while [ $wygrana -eq 0 ]
do
 gracz1;
 rysujpole;
 sprawdz_wygrana_gracz1;
 sprawdz_remis;
 gracz2; 
 rysujpole;
 sprawdz_wygrana_gracz2;
 sprawdz_remis;
done



