#include "vector_addition.cuh"

#include <iostream>
#include <cuda.h>
#include <cuda_runtime_api.h>

__device__ void
vectorAddition_kernel(int* out, int* in) {
    int i = threadIdx.x;

    if (i == 1) {
        out = in;
    }
}

void AddVectors() {
    int* dev_a;
    int* dev_b;
    int a = 1;
    int b = 0;

    cudaMalloc((void**) &dev_a, sizeof(int));
    cudaMalloc((void**) &dev_b, sizeof(int));

    cudaMemcpy(dev_a, &a, sizeof(int), cudaMemcpyHostToDevice);

    const dim3 gridDim(1, 1, 1);
    const dim3 blockDim(1, 1, 1);

    vectorAddition_kernel<<<gridDim, blockDim>>>(dev_b, dev_a);
    cudaDeviceSynchronize();

    cudaMemcpy(b, &dev_b, sizeof(int), cudaMemcpyDeviceToHost);

    std::cout << "Result: " << (b == 1) ? "ok\n" : "wrong\n";

    cudaFree(dev_a);
    cudaFree(dev_b);
}
