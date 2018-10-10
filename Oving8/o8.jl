mutable struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end
#Node(id) = Node(id, [], nothing, nothing, nothing)

function makenodelist(adj_list)
    
    top_node = Node(1, [], "white", 0, nothing)

    for i in 1:length(adj_list)
        for j in 1:length(adj_list[i])
            newNode = Node(i, [], "white", 0, nothing)
            if newNode ==
        end
        
    end


end



adj_list = [ [2,3], [3], [4], []]

makenodelist(adj_list)
