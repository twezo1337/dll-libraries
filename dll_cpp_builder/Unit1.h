//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>

typedef void (__cdecl*Fvoid)(int*, int);
typedef int (__cdecl*Fint)(int*, int);
typedef double (__cdecl*Fdouble)(double**, int);

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

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TButton *Button1;
	TButton *Button2;
	TButton *Button3;
	TMemo *Memo1;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
