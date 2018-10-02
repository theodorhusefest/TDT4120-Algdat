

function counting_sort_length(A)

    B = Array{String}(undef,length(A))

    longest = 0;
    for i in 1:length(A)   #Finner ut hvor lang C skal være
        if length(A[i]) > longest
            longest = length(A[i])
        end
    end

    C = zeros(Int,1,longest)


    for i in 1:length(A)  #Teller lengder
        C[length(A[i])] += 1;
    end

    for i in 2:length(C) #Gjør C kumulativ
        C[i] += C[i-1]
    end

    i = length(A)
    while i != 0
        B[C[length(A[i])]] = A[i]
        C[length(A[i])] -= 1
        i -= 1;
    end
    print(B)
    return B;
end

A = ["bbbb", "aa", "aaaa"]

println()
println("********** NY KJØRING *********")
println()

counting_sort_length(A)
