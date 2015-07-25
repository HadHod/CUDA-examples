#include "main_kernel.cuh"

__global__ void
vectorAddition_kernel(int* result, const int* a, const int* b, const int size) {
    unsigned long long int tid = threadIdx.x + blockIdx.x * blockDim.x;

    while (tid < size) {
        result[tid] = a[tid] + b[tid];
        tid += blockDim.x * gridDim.x;
    }
}
