#!/usr/bin/env julia

function find_median(A, l, h)

    B_low = bisect_left(A, 1, length(A)+1, l)
    B_high = bisect_right(A, 1, length(A)+1, h) - 1
    B = A[B_low:B_high]
    if length(B) == 0
        return nothing
    end
    println("Array of consideration: ", B)
    if length(B) % 2 == 0
        left_index = floor(Int, length(B)/2)
        right_index = left_index + 1
        median = (B[left_index] + B[right_index])/2
        return median
    else
        senter_index = ceil(Int, length(B)/2)
        return B[senter_index]
    end
end



function my_merge!(A, l, m, r)
    n1 = m-l+1
    n2 = r-m
    L = Array{Float64}(undef, n1 + 1)
    R = Array{Float64}(undef, n2 + 1)
    for i = 1:n1
        L[i] = A[l+i - 1]
    end
    for j = 1:n2
        R[j] = A[m+j]
    end
    L[n1+1] = Inf
    R[n2+1] = Inf
    i = 1
    j = 1
    for k = l:r
        if L[i] <= R[j]
            A[k] = L[i]
            i += 1
        else
            A[k] = R[j]
            j += 1
        end
    end
end

function merge_sort!(A, l, r)
    if l < r
        m = floor(Int, (l+r)/2)
        merge_sort!(A, l, m)
        merge_sort!(A, m+1, r)
        my_merge!(A, l, m, r)
    end
end

function algdat_sort!(A)
    merge_sort!(A, 1, length(A))
end


A = [9,8,7,6,5,3,1,2]
algdat_sort!(A)
println("Sorted: ", A)
median = find_median(A, 4,6)
if median != nothing
    println("Median: ", median)
else
    println("No values to consider in array")
    
end
