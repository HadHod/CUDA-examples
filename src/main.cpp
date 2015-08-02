#include <iostream>
#include <string>
#include <cstdlib>

#include "cuda_pieces/vector_addition/vector_addition.cuh"
#include "cuda_pieces/is_prime/is_prime.cuh"
#include "utils/number_generator.h"

using namespace std;

int main(int argc, char **argv) {

    const int DATA_LENGTH = 1;

    NumberGenerator ng;
    const int* a = ng.getRandomNumbers(DATA_LENGTH);
    const int* b = ng.getRandomNumbers(DATA_LENGTH);

    if (argc == 0) {
        cout << "Type one argument:\n";
        cout << "1 => vector addition\n";
    } else {
        const int option = stoi(argv[1]);
        switch (option) {
            case 1: AddVectors(a, b, DATA_LENGTH); break;
            case 2: IsPrime(10); break;
            default: cout << "Wrong value: " << option << "\n";
        }
    }

    delete[] a;
    delete[] b;

    return EXIT_SUCCESS;
}
