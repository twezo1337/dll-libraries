#include <Windows.h>
#include <iostream>

using namespace std;

typedef void (*Fvoid)(int*, int);
typedef int (*Fint)(int*, int);
typedef double (*Fdouble)(double**, int);

typedef double(__stdcall* Fvoid2)(int*, int);
typedef int(__stdcall* Fint2)(int*, int);
typedef int(__stdcall* Fdouble2)(double**, int);

void randomArr(int* arr, int size) {
	srand(time(0)); 

	for (int i = 0; i < size; i++)
		arr[i] = 1000.0 + 100000.0 * rand() / (float)RAND_MAX;
}
void randomMatrix(double** matrix, int size) {
	srand(time(0)); 

	for (int i = 0; i < size; i++) {
		for (int j = 0; j < size; j++) {
			matrix[i][j] = 1000.0 + 100000.0 * rand() / (float)RAND_MAX;
		}
	}
}

double maxValueArr(double arr[], int size) {
	double max = arr[0];
	for (int i = 1; i < size; i++) {
		if (arr[i] > max) {
			max = arr[i];
		}
	}
	return max;
}

double minValueArr(double arr[], int size) {
	double min = arr[0];
	for (int i = 1; i < size; i++) {
		if (arr[i] < min) {
			min = arr[i];
		}
	}
	return min;
}
double avgValueArr(double arr[], int size) {
	double sum = 0;
	for (int i = 0; i < size; i++) {
		sum += arr[i];
	}
	return sum / size;
}

void Dll_demo_working(string dll_name, string func_name[3])
{

	std::wstring dll_load_name(dll_name.begin(), dll_name.end());

	Fvoid shellSort;
	Fint multiplesOfNine;
	Fdouble avgDiagonalMatrix;

	double 	Ftime;
	LARGE_INTEGER FFrequence, FBeginCount, FEndCount;

	int nd_arr = 400000;
	int nd_matrix = 2500;
	int* arr;
	double** matrix;

	double timeArr[50];
	double minTime = 0, maxTime = 0, avgTime = 0;

	cout << dll_name << endl;

	HINSTANCE hinstLib = LoadLibrary(dll_load_name.c_str());
	if (hinstLib == NULL) {
		cout << "ОШИБКА: Не удалось загрузить DLL: " << dll_name << endl;
		return;

	}


	cout << "Библиотека (" << dll_name << ") загружена успешно!\n";
	cout << endl;

	shellSort = (Fvoid)GetProcAddress(hinstLib, func_name[0].c_str());
	if (shellSort != NULL) {
		cout << "--------------------Тестирование функции сортировки методом шелла--------------------" << endl;
		
		arr = new int[nd_arr];
		for (int iters = 0; iters < 50; iters++) {
			randomArr(arr, nd_arr);

			QueryPerformanceFrequency(&FFrequence);
			QueryPerformanceCounter(&FBeginCount);

			shellSort(arr, nd_arr);

			QueryPerformanceCounter(&FEndCount);
			Ftime = ((FEndCount.QuadPart - FBeginCount.QuadPart) / (double)FFrequence.QuadPart) * 1000;
			timeArr[iters] = Ftime;
		}
			minTime = minValueArr(timeArr, 50);
			maxTime = maxValueArr(timeArr, 50);
			avgTime = avgValueArr(timeArr, 50);
			cout << "Минимальное значение времени: " << minTime << endl;
			cout << "Максимальное значение времени: " << maxTime << endl;
			cout << "Среднее арифмитическое значение времени: " << avgTime << endl;
			
			delete[] arr;
		}
	else
		cout << "ОШИБКА: Не удалось найти DLL функцию - (" << func_name[0] << ")\n";


	multiplesOfNine = (Fint)GetProcAddress(hinstLib, func_name[1].c_str());
	if (multiplesOfNine != NULL) {
		cout << "--------------------Тестирование функции поиска элементов массива кратных 9--------------------" << endl;
		double result = 0;
		arr = new int[nd_arr];

		for (int iters = 0; iters < 50; iters++) {
			randomArr(arr, nd_arr);

			QueryPerformanceFrequency(&FFrequence);
			QueryPerformanceCounter(&FBeginCount);

			result = multiplesOfNine(arr, nd_arr);

			QueryPerformanceCounter(&FEndCount);
			Ftime = ((FEndCount.QuadPart - FBeginCount.QuadPart) / (double)FFrequence.QuadPart) * 1000;
			timeArr[iters] = Ftime;
		}
		minTime = minValueArr(timeArr, 50);
		maxTime = maxValueArr(timeArr, 50);
		avgTime = avgValueArr(timeArr, 50);
		cout << "Минимальное значение времени: " << minTime << endl;
		cout << "Максимальное значение времени: " << maxTime << endl;
		cout << "Среднее арифмитическое значение времени: " << avgTime << endl;

		delete[] arr;
	}
	else
		cout << "ОШИБКА: Не удалось найти DLL функцию - (" << func_name[1] << ")\n";


	avgDiagonalMatrix = (Fdouble)GetProcAddress(hinstLib, func_name[2].c_str());
	if (avgDiagonalMatrix != NULL) {
		cout << "--------------------Тестирование функции нахождения среднего арифметического диагонали матрицы--------------------" << endl;
		double result = 0;
		matrix = new double*[nd_matrix];
		for (int i = 0; i < nd_matrix; i++)
			matrix[i] = new double[nd_matrix];

		for (int iters = 0; iters < 50; iters++) {
			randomMatrix(matrix, nd_matrix);

			QueryPerformanceFrequency(&FFrequence);
			QueryPerformanceCounter(&FBeginCount);

			result = avgDiagonalMatrix(matrix, nd_matrix);

			QueryPerformanceCounter(&FEndCount);
			Ftime = ((FEndCount.QuadPart - FBeginCount.QuadPart) / (double)FFrequence.QuadPart) * 1000;
			timeArr[iters] = Ftime;
		}
		minTime = minValueArr(timeArr, 50);
		maxTime = maxValueArr(timeArr, 50);
		avgTime = avgValueArr(timeArr, 50);
		cout << "Минимальное значение времени: " << minTime << endl;
		cout << "Максимальное значение времени: " << maxTime << endl;
		cout << "Среднее арифмитическое значение времени: " << avgTime << endl;

		for (int i = 0; i < nd_matrix; i++)
			delete[] matrix[i];
		delete[] matrix;
	}
	else
		cout << "ОШИБКА: Не удалось найти DLL функцию - (" << func_name[2] << ")\n";

	FreeLibrary(hinstLib);
}

int main()
{
	setlocale(LC_ALL, "RUS");

	string func_name1[3] = { "shellSort","multiplesOfNine","avgDiagonalMatrix"};
	string func_name2[3] = { "_shellSort","_multiplesOfNine","_avgDiagonalMatrix" };

	cout << "!! Demonstration of C++ VisualStudio dll" << endl;
	Dll_demo_working("Dll_sample_cpp.dll", func_name1);

	cout << endl << endl << "!! Demonstration of Lazarus dll" << endl << endl;
	Dll_demo_working("dll_sample_lazarus.dll", func_name1);


	cout << endl << endl << "!! Demonstration of C++ Builder dll" << endl << endl;
	Dll_demo_working("dll_sample_cpp_builder.dll", func_name2);

	return 1;
}