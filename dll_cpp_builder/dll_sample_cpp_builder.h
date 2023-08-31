#ifndef dll_sample_cpp_builder
#define dll_sample_cpp_builder
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//сюда пишем описания своих функций
extern "C" void __declspec(dllexport) quickSort (int*, int);
extern "C" int __declspec(dllexport) multiplesOfNine (int*, int);
extern "C" double __declspec(dllexport) avgDiagonalMatrix (double**, int);
//----------------------------------------------------------------------
#endif
