//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{

}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
	Fvoid shellSort;
	shellSort = NULL;
	Fint multiplesOfNine;
	multiplesOfNine = NULL;
	Fdouble avgDiagonalMatrix;
	avgDiagonalMatrix = NULL;

	double 	Ftime;
	ULONGLONG  FFrequence, FBeginCount,  FEndCount;

	int nd_arr = 400000;
	int nd_matrix = 2500;
	int* arr;
	double** matrix;

	double timeArr[50];
	double minTime = 0, maxTime = 0, avgTime = 0;

	Memo1->Lines->Clear();

	HINSTANCE hinstLib = LoadLibrary(TEXT("dll_sample_cpp.dll"));
	if (hinstLib == NULL) {
		Memo1->Lines->Add("ERROR: unable to load DLL: dll_sample_cpp.dll");

	}
	else {
		Memo1->Lines->Add("library (dll_sample_cpp.dll) loaded");

		shellSort = (Fvoid)GetProcAddress(hinstLib, "shellSort");
		if (shellSort != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции сортировки методом шелла--------------------");
			arr = new int[nd_arr];

			for (int iters = 0; iters < 50; iters++) {
				randomArr(arr, nd_arr);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				shellSort(arr, nd_arr);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			delete[] arr;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (shellSort)");


		multiplesOfNine = (Fint)GetProcAddress(hinstLib, "multiplesOfNine");
		if (multiplesOfNine != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции поиска элементов массива кратных 9--------------------");
			arr = new int[nd_arr];
			double result = 0;

			for (int iters = 0; iters < 50; iters++) {
				randomArr(arr, nd_arr);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				result = multiplesOfNine(arr, nd_arr);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			delete[] arr;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (multiplesOfNine)");


		avgDiagonalMatrix = (Fdouble)GetProcAddress(hinstLib, "avgDiagonalMatrix");
		if (avgDiagonalMatrix != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции нахождения среднего арифметического диагонали матрицы--------------------");
			double result = 0;
			matrix = new double*[nd_matrix];
			for (int i = 0; i < nd_matrix; i++) {
				matrix[i] = new double[nd_matrix];
			}

			for (int iters = 0; iters < 50; iters++) {
				randomMatrix(matrix, nd_matrix);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				result = avgDiagonalMatrix(matrix, nd_matrix);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			for (int i = 0; i < nd_matrix; i++) {
                delete[] matrix[i];
			}
			delete[] matrix;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (avgDiagonalMatrix)");


		FreeLibrary(hinstLib);
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
	Fvoid shellSort;
	shellSort = NULL;
	Fint multiplesOfNine;
	multiplesOfNine = NULL;
	Fdouble avgDiagonalMatrix;
	avgDiagonalMatrix = NULL;

	double 	Ftime;
	ULONGLONG  FFrequence, FBeginCount,  FEndCount;

	int nd_arr = 400000;
	int nd_matrix = 2500;
	int* arr;
	double** matrix;

	double timeArr[50];
	double minTime = 0, maxTime = 0, avgTime = 0;

	Memo1->Lines->Clear();

	HINSTANCE hinstLib = LoadLibrary(TEXT("dll_sample_lazarus.dll"));
	if (hinstLib == NULL) {
		Memo1->Lines->Add("ERROR: unable to load DLL: dll_sample_lazarus.dll");

	}
	else {
		Memo1->Lines->Add("library (dll_sample_lazarus.dll) loaded");

		shellSort = (Fvoid)GetProcAddress(hinstLib, "shellSort");
		if (shellSort != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции сортировки методом шелла--------------------");
			arr = new int[nd_arr];

			for (int iters = 0; iters < 50; iters++) {
				randomArr(arr, nd_arr);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				shellSort(arr, nd_arr);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			delete[] arr;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (shellSort)");


		multiplesOfNine = (Fint)GetProcAddress(hinstLib, "multiplesOfNine");
		if (multiplesOfNine != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции поиска элементов массива кратных 9--------------------");
			arr = new int[nd_arr];
			double result = 0;

			for (int iters = 0; iters < 50; iters++) {
				randomArr(arr, nd_arr);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				result = multiplesOfNine(arr, nd_arr);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			delete[] arr;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (multiplesOfNine)");


		avgDiagonalMatrix = (Fdouble)GetProcAddress(hinstLib, "avgDiagonalMatrix");
		if (avgDiagonalMatrix != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции нахождения среднего арифметического диагонали матрицы--------------------");
			double result = 0;
			matrix = new double*[nd_matrix];
			for (int i = 0; i < nd_matrix; i++) {
				matrix[i] = new double[nd_matrix];
			}

			for (int iters = 0; iters < 50; iters++) {
				randomMatrix(matrix, nd_matrix);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				result = avgDiagonalMatrix(matrix, nd_matrix);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			for (int i = 0; i < nd_matrix; i++) {
				delete[] matrix[i];
			}
			delete[] matrix;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (avgDiagonalMatrix)");


		FreeLibrary(hinstLib);
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
    Fvoid shellSort;
	shellSort = NULL;
	Fint multiplesOfNine;
	multiplesOfNine = NULL;
	Fdouble avgDiagonalMatrix;
	avgDiagonalMatrix = NULL;

	double 	Ftime;
	ULONGLONG  FFrequence, FBeginCount,  FEndCount;

	int nd_arr = 400000;
	int nd_matrix = 2500;
	int* arr;
	double** matrix;

	double timeArr[50];
	double minTime = 0, maxTime = 0, avgTime = 0;

	Memo1->Lines->Clear();

	HINSTANCE hinstLib = LoadLibrary(TEXT("dll_sample_cpp_builder.dll"));
	if (hinstLib == NULL) {
		Memo1->Lines->Add("ERROR: unable to load DLL: dll_sample_cpp_builder.dll");

	}
	else {
		Memo1->Lines->Add("library (dll_sample_cpp_builder.dll) loaded");

		shellSort = (Fvoid)GetProcAddress(hinstLib, "_shellSort");
		if (shellSort != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции сортировки методом шелла--------------------");
			arr = new int[nd_arr];

			for (int iters = 0; iters < 50; iters++) {
				randomArr(arr, nd_arr);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				shellSort(arr, nd_arr);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			delete[] arr;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (shellSort)");


		multiplesOfNine = (Fint)GetProcAddress(hinstLib, "_multiplesOfNine");
		if (multiplesOfNine != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции поиска элементов массива кратных 9--------------------");
			arr = new int[nd_arr];
			double result = 0;

			for (int iters = 0; iters < 50; iters++) {
				randomArr(arr, nd_arr);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				result = multiplesOfNine(arr, nd_arr);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			delete[] arr;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (multiplesOfNine)");


		avgDiagonalMatrix = (Fdouble)GetProcAddress(hinstLib, "_avgDiagonalMatrix");
		if (avgDiagonalMatrix != NULL) {
			Memo1->Lines->Add("--------------------Тестирование функции нахождения среднего арифметического диагонали матрицы--------------------");
			double result = 0;
			matrix = new double*[nd_matrix];
			for (int i = 0; i < nd_matrix; i++) {
				matrix[i] = new double[nd_matrix];
			}

			for (int iters = 0; iters < 50; iters++) {
				randomMatrix(matrix, nd_matrix);

				QueryPerformanceFrequency((LARGE_INTEGER*)&FFrequence);
				QueryPerformanceCounter((LARGE_INTEGER*)&FBeginCount);

				result = avgDiagonalMatrix(matrix, nd_matrix);

				QueryPerformanceCounter((LARGE_INTEGER*)&FEndCount);
				Ftime = ((FEndCount - FBeginCount) / (double)FFrequence) * 1000;
				timeArr[iters] = Ftime;
			}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			Memo1->Lines->Add("Минимальное значение времени: " + FloatToStr(minTime) + " ms");
			Memo1->Lines->Add("Максимальное значение времени: " + FloatToStr(maxTime) + " ms");
			Memo1->Lines->Add("Среднее арифмитическое значение времени: " + FloatToStr(avgTime) + " ms");

			for (int i = 0; i < nd_matrix; i++) {
				delete[] matrix[i];
			}
			delete[] matrix;
		}
		else
			Memo1->Lines->Add("ERROR: unable to find DLL function (avgDiagonalMatrix)");


		FreeLibrary(hinstLib);
	}
}
//---------------------------------------------------------------------------
