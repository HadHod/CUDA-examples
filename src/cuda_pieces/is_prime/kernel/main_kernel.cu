#include "main_kernel.cuh"

__global__ void
isPrime_kernel(bool &isPrime) {
    isPrime = true;
    __syncthreads();
}
