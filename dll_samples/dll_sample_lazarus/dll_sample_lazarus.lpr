library dll_sample_lazarus;

{$mode objfpc}{$H+}

uses
  Classes
  { you can add units after this };

type
TIntArray = array[Word] of integer;
PIntArray = ^TIntArray;


type
  t2dArrayP =  array[Word] of array of Double;
  p2dArray = ^t2dArrayP;

procedure shellSort(arr: PIntArray; size: integer) cdecl;
var
  lo, hi, i, j, incr, tmp: Integer;
begin
  lo := 0;//минимальный индекс массива
  hi := size - 1;//максимальный индекс массива
  incr := hi div 2; // начальный инкремент
  while (incr > lo)
  do begin
     i := incr;
     while (i <= hi)
     do begin // Внутренний цикл простых вставок
        j := i - incr;
        while (j > lo - 1)
        do if (arr^[j] > arr^[j+incr])
           then begin
                tmp := arr^[j];
                arr^[j] := arr^[j+incr];
                arr^[j+incr] := tmp;
                j := j - incr;
                end
           else j := lo - 1;//Останов
        Inc(i);
        end;
     incr := incr div 2;
     end;
end;

function multiplesOfNine(arr: PIntArray; size: integer): integer; cdecl;
var
i,sum:integer;
 begin
   sum := 0;
   for I := 0 to size-1 do
   begin
      if (arr^[i] Mod 9)=0 then
         sum := sum + 1;
   end;
   result := sum;
 end;
function avgDiagonalMatrix(arr: p2dArray; size: integer): Double; cdecl;
var
sum:Double;
i, j: integer;
 begin
   sum := 0;
   for i := 0 to size-1 do
      for j := 0 to size-1 do
      begin
         if i = j then
            sum := sum + arr^[i][j];
      end;
   sum := sum / size;
   result := sum;
 end;

{ Этот набор функций экспортируется }
 exports
   shellSort,multiplesOfNine,avgDiagonalMatrix;

begin
end.

