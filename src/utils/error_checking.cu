#include "error_checking.cuh"

#include <iostream>

inline void gpuAssert(const cudaError_t code, const char *file, int line, const bool abort=true) {
    if (code != cudaSuccess) {
        fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
        if (abort) {
            exit(code);
        }
    }
}

void gpuErrorCheck(cudaError_t ans) {
    gpuAssert((ans), __FILE__, __LINE__);
}
