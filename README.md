# Gaussian-Elimination-Julia

This code can be used to perform gaussian elimination (where number of unkowns is equal to the number of equations). It was coded in julia as julia is faster in dealing with matrices compared to python.

This code takes in two inputs: name of a csv file and a number n.
The first n columns of the csv file contains the matrix A and the (n + 1)th column contains the B vector such that Ax = B

It gives the following as the output:
1. if the solution is unique: prints the solution
2. The program terminates if there are infinte or no solutions, and the same is printed as the output.

## Packages

Inorder to read from the CSV file, you will need the following packages:
1. CSV
2. DataFrames

Installation process:

1. The CSV package can be installed by running the following in the terminal:
    using Pkg
    Pkg.add("CSV")
2. The DataFrames package can be installed by running the following:
    using Pkg
    Pkg.add("DataFrames")

