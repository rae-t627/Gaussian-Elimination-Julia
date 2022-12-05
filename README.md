# Gaussian-Elimination-Julia

This code can be used to perform gaussian elimination (where number of unkowns is equal to the number of equations). It was coded in julia as julia is faster in dealing with matrices compared to python.

This code takes in two inputs: name of a csv file and a number n.
The first n columns of the csv file contains the matrix A and the (n + 1)th column contains the B vector such that Ax = B

It gives the following as the output:
i) if the solution is unique: prints the solution
ii) The program terminates if there are infinte or no solutions, and the same is printed as the output.
