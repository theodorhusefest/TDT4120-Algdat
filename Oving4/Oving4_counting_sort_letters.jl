

function counting_sort_letters(A, position)
    B = Array{String}(undef,length(A))
    C = zeros(Int,1,26)
    converted_letter = 0

    for i in 1:length(A)
        converted_letter = Int(A[i][position]-96)
        C[converted_letter] += 1;
    end

    for i in 2:26
        C[i] += C[i-1]
    end


    i = length(A)
    while i != 0
        converted_letter = Int(A[i][position]-96)

        B[C[converted_letter]] = A[i]
        C[converted_letter] = C[converted_letter] -1
        i -= 1
    end
    return B
end


A = ["ccc", "cba", "ca", "ab", "abc"]
println()
println("********** NY KJØRING *********")
println()

counting_sort_letters(A,2)
