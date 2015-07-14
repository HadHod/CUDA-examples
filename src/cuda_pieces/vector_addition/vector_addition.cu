#include <iostream>
#include <cuda.h>
#include <cuda_runtime_api.h>

#include "vector_addition.cuh"
#include "kernel/main_kernel.cuh"
#include "../../utils/error_checking.cuh"

void AddVectors() {
    const dim3 gridDim(1, 1, 1);
    const dim3 blockDim(1, 1, 1);

    vectorAddition_kernel<<<1, 1>>>();
    gpuErrorCheck( cudaDeviceSynchronize() );
}

void AddVectors(int* a, int* b) {

}
