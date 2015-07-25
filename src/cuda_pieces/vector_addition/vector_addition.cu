#include <iostream>
#include <cuda.h>
#include <cuda_runtime_api.h>

#include "vector_addition.cuh"
#include "kernel/main_kernel.cuh"
#include "../../utils/error_checking.cuh"

using namespace std;

void AddVectors() {
    // TODO
}

void AddVectors(const int* a, const int* b, const int dataLength) {
    const size_t MEMORY_SIZE = dataLength * sizeof(int);

    int* result = new int[dataLength];

    int* dev_a;
    int* dev_b;
    int* dev_result;

    gpuErrorCheck( cudaMalloc((void**) &dev_a, MEMORY_SIZE) );
    gpuErrorCheck( cudaMalloc((void**) &dev_b, MEMORY_SIZE) );
    gpuErrorCheck( cudaMalloc((void**) &dev_result, MEMORY_SIZE) );

    gpuErrorCheck( cudaMemcpy(dev_a, a, MEMORY_SIZE, cudaMemcpyHostToDevice) );
    gpuErrorCheck( cudaMemcpy(dev_b, b, MEMORY_SIZE, cudaMemcpyHostToDevice) );

    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    const int threadsPerBlock = min(prop.maxThreadsPerBlock, prop.maxThreadsDim[0]); // Number of threads per block can be less then max threads dimension?

    const dim3 gridDim((dataLength / threadsPerBlock) + 1, 1, 1);
    const dim3 blockDim(threadsPerBlock, 1, 1);

    vectorAddition_kernel<<<gridDim, blockDim>>>(dev_result, dev_a, dev_b, dataLength);
    gpuErrorCheck( cudaPeekAtLastError() );
    gpuErrorCheck( cudaDeviceSynchronize() );

    gpuErrorCheck( cudaMemcpy(result, dev_result, MEMORY_SIZE, cudaMemcpyDeviceToHost) );

    for (int i=0; i<10; i++) {
        cout << i << " : " << result[i] << " = " << a[i] << " + " << b[i] << "\n";
    }

    delete[] a;
    delete[] b;
    delete[] result;

    cudaFree(dev_a);
    cudaFree(dev_b);
    cudaFree(dev_result);
}
