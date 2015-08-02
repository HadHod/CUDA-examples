#include "is_prime.cuh"
#include "kernel/main_kernel.cuh"

#include <iostream>

using namespace std;

void IsPrime(int a) {
    int* number = &a;
    int* dev_number;
    bool* result = malloc(sizeof(bool));
    bool* dev_result;

    cudaMalloc((void**) &dev_result, sizeof(bool));
    cudaMalloc((void**) &dev_number, sizeof(int));

    cudaMemcpy(dev_number, number, sizeof(int), cudaMemcpyHostToDevice);

    dim3 dimGrid(1, 1, 1);
    dim3 dimBlock(1, 1, 1);
    isPrime_kernel<<<dimGrid, dimBlock>>>(result, number);
    cudaDeviceSynchronize();

    cudaMemcpy(result, dev_result, sizeof(bool), cudaMemcpyDeviceToHost);

    cudaFree(dev_result);
    cudaFree(dev_number);

    cout << "Result: " << result << "\n";
}
