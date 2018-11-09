

function floyd_warshall(adj_matrix, n, f, g)
    D = zeros(Float64, n, n)
    P = zeros(Float64, n, n)
    for i in 1:n
        for j in 1:n
            D[i,j] = adj_matrix[i,j]
            if D[i,j] != Inf
                P[i,j] = i
            end
        end 
    end
    for k in 1:n
        for i in 1:n
            for j in 1:n
                if D[i,j] != f(D[i,j], g(D[i,k],D[k,j]))
                    D[i,j] = D[i,k] + D[k,j]
                    P[i,j] = P[k,j]
                end
            end 
        end
    end
    return D
end


function transitive_closure(adj_matrix,n)
    T = floyd_warshall(adj_matrix, n, min, +)
    for i in 1:n
        for j in 1:n
            if T[i,j] == Inf
                T[i,j] = 0
            else
                T[i,j] = 1
            end
        end
    end 
    return T
end


adjacency_matrix = [0 7 2; Inf 0 Inf; Inf 4 0]
f = min
g = +


#floyd_warshall(adjacency_matrix, 3, f, g)
transitive_closure(adjacency_matrix, 3)

