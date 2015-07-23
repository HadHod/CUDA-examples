#include <iostream>
#include <cuda.h>
#include <cuda_runtime_api.h>

#include "vector_addition.cuh"
#include "kernel/main_kernel.cuh"
#include "../../utils/error_checking.cuh"

void AddVectors() {

}

void AddVectors(const int* a, const int* b, const int dataLength) {
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    const int threadsPerBlock = min(prop.maxThreadsPerBlock, prop.maxThreadsDim[0]); // Number of threads per block can be less then max threads dimension?

    const dim3 gridDim(ceil((float) dataLength / threadsPerBlock), 1, 1);
    const dim3 blockDim(threadsPerBlock, 1, 1);

    vectorAddition_kernel<<<gridDim, blockDim>>>();
    gpuErrorCheck( cudaDeviceSynchronize() );
}
