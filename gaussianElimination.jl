@time begin

    #following line can be used when printing the matrix after forward elimination into an excel sheet
    #import XLSX

    #takes 3 parameters: Matrix, row, size of the matrix. The function swaps the row with the last row of the Matrix
    function swaprow(Matrix_gauss, i, size_matrix)

        for j in 1:size_matrix+1
            x = Matrix_gauss[i,j]
            Matrix_gauss[i, j] = Matrix_gauss[size_matrix, j]
            Matrix_gauss[size_matrix, j] = x
        end

    end

    #file should be entered without " "
    csv_file = readline()

    #input n
    size_matrix = readline()
    size_matrix = parse(Int64, size_matrix)

    using CSV
    using DataFrames
    df = CSV.read(csv_file, DataFrame, header = false)

    Matrix_gauss = Matrix{Float64}(df)

    #forward elimination
    for i in 1:(size_matrix-1)

       for j in (i+1):size_matrix

            if (abs(Matrix_gauss[i, i]) < 0.0001 )
                swaprow(Matrix_gauss, i, size_matrix)
            end
            
            if (abs(Matrix_gauss[j, i]) < 0.0001)
                continue
            end

            ratio = Matrix_gauss[j, i] / Matrix_gauss[i, i]

            Matrix_gauss[j,:] = Matrix_gauss[j,:] - (ratio .* Matrix_gauss[i,:])
                
       end    
    end

    #following line can be used when printing the matrix after forward elimination into an excel sheet
    #XLSX.openxlsx("my_new_file.xlsx", mode="w") do xf
    #   sheet = xf[1]
    #   XLSX.rename!(sheet, "new_sheet")
    #   sheet["A1:SG500"] = Matrix_gauss #coordinates may need to be changed
    #end
    
    #back substitution
    if (Matrix_gauss[size_matrix, size_matrix] == 0)

        if (Matrix_gauss[size_matrix, size_matrix + 1] == 0)
            println("Infinte solutions")
        else
            println("No solutions")
        end

    else

        x = Vector{Float64}(undef, size_matrix)
        x[size_matrix] = Matrix_gauss[size_matrix, size_matrix + 1]/Matrix_gauss[size_matrix, size_matrix]

        for i in size_matrix - 1: -1: 1
            x[i] = Matrix_gauss[i, size_matrix+1] - sum(Matrix_gauss[i, i+1:end-1] .* x[i+1:end])
            x[i] /= Matrix_gauss[i,i]
        end

        println(x)
    end
end