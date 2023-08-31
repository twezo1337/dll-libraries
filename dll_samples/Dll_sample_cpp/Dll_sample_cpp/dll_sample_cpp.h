#pragma once

#include "pch.h"
#include <windows.h>
#include <iostream>


#define DLLEXPORT extern "C" __declspec(dllexport)

DLLEXPORT void shellSort(int* arr, int size);
DLLEXPORT int multiplesOfNine(int* arr, int size);
DLLEXPORT double avgDiagonalMatrix(double** arr, int size);