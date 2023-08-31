#include "pch.h"
#include "dll_sample_cpp.h"

DLLEXPORT void shellSort(far int* arr, int size) {
    int i, j, step;
    int tmp;
    for (step = size / 2; step > 0; step /= 2)
        for (i = step; i < size; i++)
        {
            tmp = arr[i];
            for (j = i; j >= step; j -= step)
            {
                if (tmp < arr[j - step])
                    arr[j] = arr[j - step];
                else
                    break;
            }
            arr[j] = tmp;
        }
}

DLLEXPORT int multiplesOfNine(far int* arr, int size) {
    int sum = 0;

    for (int i = 0; i < size; i++) {
        if (arr[i] % 9 == 0) {
            sum++;
        }
    }

    return sum;
}

DLLEXPORT double avgDiagonalMatrix(far double** arr, int size) {
    double sum = 0;
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            if (i == j) {
                sum += arr[i][j];
            }
        }
    }

    return sum / size;
}