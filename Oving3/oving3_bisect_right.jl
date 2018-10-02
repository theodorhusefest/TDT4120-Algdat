" Oving 3 binærsøk "

function bisect_right(A, start, last, v)
    i = floor(Int,(start+last)/2)
    if start < last
        q = floor(Int,(start+last)/2)
        print("q = ", q, " ")
        if v >= A[q]
            i = bisect_right(A, q+1, last, v)
        else
            i = bisect_right(A, start, q, v)
        end
    end
    return i
end


function bisect_left(A, p, r, v)
    i = p
    if p < r
       q = floor(Int, (p+r)/2)  # floor() er en innebygd funksjon som runder ned. ceil() runder opp.
       if v <= A[q]
           i = bisect_left(A, p, q, v)
       else
           i = bisect_left(A, q+1, r, v)
       end
    end
    return i
end

function makeList()
    A = []
    for i in 1:50
        push!(A,rand(1:100))
    end
    sort!(A)
    """for i in 1:10
        print(A[i], " ")
    end"""
    return A
end


A = makeList()
print(A)
print(bisect_right(A, 1, length(A) + 1 ,89))
