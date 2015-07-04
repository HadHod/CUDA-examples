#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

int main(int argc, char **argv) {
    cout << "Choose algorithm option:\n";
    cout << "1 => vector addition\n";

    string option;
    cin >> option;

    if (option == "1") {
        VectorAddition();
    } else {
        cout << "Wrong value: " << option << "\n";
    }

    return EXIT_SUCCESS;
}
