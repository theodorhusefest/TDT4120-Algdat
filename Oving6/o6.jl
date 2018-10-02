

function cumulative(W)
    
    C = copy(W)
    
    rows, cols = size(W)
    temp_list = []
    
    for i in 2:rows
        for j in 1:cols
            if  j == 1
                push!(temp_list, C[i-1,j])
                push!(temp_list, C[i-1, j+1])
            elseif j == cols
                push!(temp_list, C[i-1,j-1])
                push!(temp_list, C[i-1,j])
            else
                push!(temp_list, C[i-1, j-1])
                push!(temp_list, C[i-1, j])
                push!(temp_list, C[i-1, j+1])
            end
            C[i,j] += minimum(temp_list)
            temp_list = []
        end
    end
    return C
end

function back_track(W)

    path = []
    
    rows, cols = size(W)

    temp_list = []

    current_col = 1
    min = W[rows,1]

    for j in 2:cols                     #Find starting index
        if W[rows, j] < min
            min = W[rows, j]
            current_col = j
        end
    end

    push!(path, (rows,current_col))

    for row in rows-1:-1:1
        if current_col == 1
            if W[row, current_col] <= W[row, current_col]
                push!(path, (row, current_col))
            else
                current_col += 1
                push!(path, (row, current_col))
            end

        elseif current_col == cols
            if W[row, current_col - 1] <= W[row, current_col]
                current_col -= 1
                push!(path, (row, current_col))
            else
                push!(path, (row, current_col))
            end

        else
            if (W[row, current_col - 1] <= W[row, current_col]) .& (W[row, current_col - 1] <= W[row, current_col + 1])
                current_col -= 1
                push!(path, (row, current_col))

            elseif W[row, current_col] <= W[row, current_col + 1]
                push!(path, (row, current_col))

            else
                current_col += 1
                push!(path, (row, current_col))
            end
                    


        end

    end
    return path

end


path_weights = [3  6  8  6  3;
                10 9  11 10 6;
                13 19 13 7  12;
                23 17 10 8  9;
                23 11 15 11 17]


weights = [3  6  8 6 3;
           7  6  5 7 3;
           4  10 4 1 6;
           10 4  3 1 2;
           6  1  7 3 9]

cumulative(weights)

back_track(path_weights)
