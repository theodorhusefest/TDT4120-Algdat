
function merge2!(A, p, q, r) #A er array, p er start, q er midt, r er siste indeks)
    lengthL = q - p + 1
    lengthR = r - q

    L = []
    R = []
    for i in 1:lengthL
        push!(L,A[i])
    end
    for i in 1:lengthR
        push!(R,A[q+i])
    end
    push!(L,Inf)
    push!(R,Inf)

    i = j = 1
    for k in 1:r
        if L[i] <= R[j]
            A[k] = L[i]
            i = i + 1
        else
            A[k] = R[j]
            j = j + 1
        end
    end
end

function merge3!(A::Array{Any}, L::Array{Any}, R::Array{Any})
    i = j = 1
    lenA = length(A)


    for k in 1:lenA
        if L[i] <= R[j]
             A[k] = L[i]
             i = i + 1
        else
            A[k] = R[j]
            j = j + 1
        end
    end
end



function algdat_sort!(A)

    len = length(A)
    len <= 1 && return A

    q = floor(Int,(len+1)/2)

    println("A[1:q] = ", A[1:q])
    println("A[q+1:end] = ", A[q+1:end])



    algdat_sort!(A[1:q])
    algdat_sort!(A[q+1:end])
    println("A etter = ", A)
    merge2!(A, 1, q, len)
    println("A merged = ", A, "\n")

end


function makeList()
    A = []
    for i in 1:8
        push!(A,rand(1:20))
    end
    """sort!(A)"""
    return A
end

println()
println("************** NY KJØRING ***************")
println()


#A = makeList()
A = [4,2,3,1]
print("A = ", A, "\n")


#merge2!(A, 1, floor(Int,(length(A) + 1)/2), length(A))
#merge3!([12,6,3,1],[12,6],[3,1])

algdat_sort!(A)

print("Sortert A = ", A, "\n")
