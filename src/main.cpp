#include <iostream>
#include <string>
#include <cstdlib>

#include "cuda_pieces/vector_addition/vector_addition.cuh"
#include "utils/number_generator.h"

using namespace std;

int main(int argc, char **argv) {

    const int DATA_LENGTH = 1000;

    NumberGenerator ng;
    const int* a = ng.getRandomNumbers(DATA_LENGTH);
    const int* b = ng.getRandomNumbers(DATA_LENGTH);

    if (argc == 0) {
        cout << "Type one argument:\n";
        cout << "1 => vector addition\n";
    } else {
        const int option = stoi(argv[1]);
        if (option == 1) {
            AddVectors(a, b, DATA_LENGTH);
        } else {
            cout << "Wrong value: " << option << "\n";
        }
    }

    return EXIT_SUCCESS;
}
