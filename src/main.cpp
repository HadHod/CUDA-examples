#include <iostream>
#include <string>
#include <cstdlib>

#include "cuda_pieces/vector_addition/vector_addition.h";

using namespace std;

int main(int argc, char **argv) {

    if (argc == 0) {
        cout << "Type one argument:\n";
        cout << "1 => vector addition\n";
    } else {
        const int option = stoi(argv[1]);
        if (option == 1) {
            AddVectors();
        } else {
            cout << "Wrong value: " << option << "\n";
        }
    }

    return EXIT_SUCCESS;
}
