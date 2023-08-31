unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Windows;

type
  TIntArray = array[Word] of integer;
  PIntArray = ^TIntArray;

  t2dArrayP =  array of array of Double;
  p2dArray = ^t2dArrayP;

  Fvoid = procedure(arr: PIntArray; size: integer) cdecl;
  Fint = function(arr: PIntArray; size: integer): integer; cdecl;
  Fdouble = function(matrix: t2dArrayP; size: integer): double; cdecl;

const
  func_name1: array [0..2] of string = ('shellSort', 'multiplesOfNine', 'avgDiagonalMatrix');
  func_name2: array [0..2] of string = ('_shellSort', '_multiplesOfNine', '_avgDiagonalMatrix');

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure Dll_demo_working(dll_name: string; f_list: array of string);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure randomArr(arr: PIntArray; size: integer);
var
  i: integer;
begin
	for i := 0 to size - 1 do
        begin
	     arr^[i] := Random(100000);
        end;
end;
procedure randomMatrix(matrix: t2dArrayP; size: integer);
var
  i, j: integer;
begin
	for i := 0 to size - 1 do
            for j := 0 to size - 1 do
            begin
	         matrix[i][j] := Random(100000) / 1.04;
            end;
end;

function maxValueArr(arr: array of Double; size: integer): double;
var
  i: integer;
  max: double;
begin
	max := arr[0];
	for i := 1 to size - 1 do
        begin
	     if arr[i] > max then
	        max := arr[i];
        end;
        result := max;
end;
function minValueArr(arr: array of Double; size: integer): double;
var
  i: integer;
  min: double;
begin
	min := arr[0];
	for i := 1 to size - 1 do
        begin
	     if arr[i] < min then
	        min := arr[i];
        end;
        result := min;
end;
function avgValueArr(arr: array of Double; size: integer): double;
var
  i: integer;
  sum: double;
begin
	sum := 0;
	for i := 0 to size - 1 do
        begin
	     sum := sum + arr[i];
        end;
        result := sum / size;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Dll_demo_working('dll_sample_cpp.dll', func_name1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Dll_demo_working('dll_sample_lazarus.dll', func_name1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Dll_demo_working('dll_sample_cpp_builder.dll', func_name2);
end;

procedure TForm1.Dll_demo_working(dll_name: string; f_list: array of string);
var
  Ftime, res: Double;
  FFrequence: TLargeInteger;
  FBeginCount: TLargeInteger;
  FEndCount: TLargeInteger;

  hLib: THandle;
  nd_arr, nd_matrix, i,k, j, result: integer;

  timeArr: array [0..49] of Double;
  minTime, maxTime, avgTime: Double;

  fshellSort: Fvoid;
  fmultiplesOfNine: Fint;
  favgDiagonalMatrix: Fdouble;

  Farr: array of integer;
  arr: PIntArray;
  Fmatrix: array of array of Double;
  matrix: p2dArray;

begin
  hLib := 0;
  nd_arr := 400000;
  nd_matrix := 2500;
  minTime := 0;
  maxTime := 0;
  avgTime := 0;

  Memo1.Lines.Clear;
  if hLib = 0 then
    hLib := SafeLoadLibrary(dll_name);
  if hLib = 0 then
  begin
    Memo1.Lines.Add('ERROR: unable to load DLL: ' + dll_name);
    exit;
  end;
  Memo1.Lines.Add('Библиотека' + dll_name +
    ' Успешно загружена');

  Memo1.Lines.Add('Test Start');

  Memo1.Lines.Add('');

  Pointer(fshellSort) := GetProcAddress(hLib, PChar(f_list[0]));
  if (fshellSort <> nil) then
  begin
    Memo1.Lines.Add('--------------------Тестирование функции сортировки методом шелла--------------------');
    SetLength(Farr, nd_arr);
    arr := @Farr[0];

    for i := 0 to 49 do
    begin
         randomArr(arr, nd_arr);
         QueryPerformanceFrequency(FFrequence);
         QueryPerformanceCounter(FBeginCount);

         fshellSort(arr, nd_arr);

         QueryPerformanceCounter(FEndCount);
         Ftime := ((FEndCount - FBeginCount) / FFrequence) * 1000;
         timeArr[i] := Ftime;
    end;
    minTime := minValueArr(timeArr, 50);
    maxTime := maxValueArr(timeArr, 50);
    avgTime := avgValueArr(timeArr, 50);
    Memo1.Lines.Add('Минимальное значение времени: ' + floattostr(minTime) + ' ms');
    Memo1.Lines.Add('Максимальное значение времени: ' + floattostr(maxTime) + ' ms');
    Memo1.Lines.Add('Среднее арифмитическое значение времени: ' + floattostr(avgTime) + ' ms');
  end
  else
    Memo1.Lines.Add('Не удалось найти функцию ' + f_list[0]);

  Memo1.Lines.Add('');

  Pointer(fmultiplesOfNine) := GetProcAddress(hLib, PChar(f_list[1]));
  if (fmultiplesOfNine <> nil) then
  begin
    Memo1.Lines.Add('--------------------Тестирование функции поиска элементов массива кратных 9--------------------');
    SetLength(Farr, nd_arr);
    arr := @Farr[0];

    for i := 0 to 49 do
    begin
         randomArr(arr, nd_arr);
         QueryPerformanceFrequency(FFrequence);
         QueryPerformanceCounter(FBeginCount);

         result := fmultiplesOfNine(arr, nd_arr);

         QueryPerformanceCounter(FEndCount);
         Ftime := ((FEndCount - FBeginCount) / FFrequence) * 1000;
         timeArr[i] := Ftime;
    end;
    minTime := minValueArr(timeArr, 50);
    maxTime := maxValueArr(timeArr, 50);
    avgTime := avgValueArr(timeArr, 50);
    Memo1.Lines.Add('Минимальное значение времени: ' + floattostr(minTime) + ' ms');
    Memo1.Lines.Add('Максимальное значение времени: ' + floattostr(maxTime) + ' ms');
    Memo1.Lines.Add('Среднее арифмитическое значение времени: ' + floattostr(avgTime) + ' ms');
  end
  else
    Memo1.Lines.Add('Не удалось найти функцию ' + f_list[1]);

  Pointer(favgDiagonalMatrix) := GetProcAddress(hLib, PChar(f_list[2]));
  if (favgDiagonalMatrix <> nil) then
    begin
    Memo1.Lines.Add('--------------------Тестирование функции нахождения среднего арифметического диагонали матрицы--------------------');
    SetLength(Fmatrix, nd_matrix);
    for i:=0 to nd_matrix-1 do
        SetLength(Fmatrix[i],nd_matrix);

    for i := 0 to 49 do
    begin
         randomMatrix(Fmatrix, nd_matrix);
         QueryPerformanceFrequency(FFrequence);
         QueryPerformanceCounter(FBeginCount);

         res := favgDiagonalMatrix(Fmatrix, nd_matrix);

         QueryPerformanceCounter(FEndCount);
         Ftime := ((FEndCount - FBeginCount) / FFrequence) * 1000;
         timeArr[i] := Ftime;
    end;
    minTime := minValueArr(timeArr, 50);
    maxTime := maxValueArr(timeArr, 50);
    avgTime := avgValueArr(timeArr, 50);
    Memo1.Lines.Add('Минимальное значение времени: ' + floattostr(minTime) + ' ms');
    Memo1.Lines.Add('Максимальное значение времени: ' + floattostr(maxTime) + ' ms');
    Memo1.Lines.Add('Среднее арифмитическое значение времени: ' + floattostr(avgTime) + ' ms');
  end
  else
    Memo1.Lines.Add('Не удалось найти функцию ' + f_list[2]);

  if hLib <> 0 then
    FreeLibrary(hLib);
  hLib := 0;
end;

end.

