

function flexradix(A, max_length)
    B = Array{String}(undef,length(A))

    A = B = counting_sort_length(A)
    println("B = ", B)

    i = length(A)
    while i > 0
        try

            println("Sorterer på plass nr: ", i)
            B = counting_sort_letters(A,i)
            println("B = ", B)


        catch y
            if isa(y, BoundsError)
                #println("Error")
            end

        end
        i -= 1;
    end

    println(B)
    return B
end

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
    return B;
end

A = ["kobra", "aggie", "agg", "kort", "hyblen"]

println()
println("********** NY KJØRING *********")
println()

flexradix(A,6)
