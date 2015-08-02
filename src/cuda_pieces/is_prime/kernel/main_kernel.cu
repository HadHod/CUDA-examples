#include "main_kernel.cuh"

__global__ void
isPrime_kernel(bool isPrime, const int* a) {
    isPrime = true;
    __syncthreads();
}
