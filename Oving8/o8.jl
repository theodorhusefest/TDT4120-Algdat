
using Pkg
Pkg.add("DataStructures")

using DataStructures: Queue, enqueue!, dequeue!


mutable struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end
Node(id) = Node(id, [], nothing, nothing, nothing)

function makenodelist(adj_list)
    
    nodes_made_index = []
    nodes = []


    for i in 1:length(adj_list)
       
        if i in nodes_made_index
            for node in nodes
                if node.id == i
                    current_node = node
                end
            end
        else
            current_node = Node(i)
            current_node.color = "white"

            push!(nodes, current_node)
            push!(nodes_made_index, i)
        end


        for j in 1:length(adj_list[i])

            if adj_list[i][j] in nodes_made_index
                for node in nodes
                    if node.id == adj_list[i][j]
                        push!(current_node.neighbours, node)
                    end
                end

            else
                new_node = Node(adj_list[i][j])
                new_node.predecessor = current_node
                new_node.color = "white"

                push!(nodes, new_node)
                push!(current_node.neighbours, new_node)
                push!(nodes_made_index, adj_list[i][j])
            end
        end
    end

    return nodes
end

function isgoalnode(node)
    if node.id == 4
        return true
    end
    return false
end


function bfs!(nodes, start)
    
    for node in nodes
        node.color == "white"
    end

    start.color = "grey"
    start.distance = 0
    
    q = Queue{Node}()


    enqueue!(q, start)

    while !(isempty(q))
        u = dequeue!(q)
        if isgoalnode(u)
             return u
        end
        for v in u.neighbours
            if v.color == "white"
                v.color = "grey"
                v.distance = u.distance + 1
                v.predecessor = u
                enqueue!(q,v)
            end
            
        end
        u.color = "black"
    end
    return nothing
end


function makepathto(goal_node)
    path = [goal_node.id]
    current_node = goal_node
    while current_node.predecessor != nothing
        current_node = current_node.predecessor
        push!(path, current_node.id)
    
    return reverese(path)
end

adj_list = [ [2,3], [3], [4], []]
#adj_list = [[3, 5], [], [1, 2, 4, 5], [3, 5], [1, 3, 4]]
#adj_list = [[2, 3, 4], [1, 3, 4], [1, 2, 4], [1, 2, 3]]

nodes = makenodelist(adj_list)
println(bfs!(nodes, nodes[1]).id)

