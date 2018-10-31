
using Pkg
Pkg.add("DataStructures")

using DataStructures: Queue, enqueue!, dequeue!

mutable struct Node
    ip::Int
    neighbours::Array{Tuple{Node,Int}}
    risk::Union{Float64, Nothing}
    predecessor::Union{Node, Nothing}
    probability::Float64
end

function initialize_single_source!(graph, start)
    for node in graph
        node.risk = Inf
        node.predecessor = nothing
    end
    start.risk = 0
end 


function relax!(from_node, to_node, cost)
    new_risk = from_node.risk + cost / to_node.probability
    if to_node.risk > new_risk
        to_node.risk = new_risk
        to_node.predecessor = from_node
    end
end
    
function extract_min!(graph)
    min_node = graph[1]
    for node in graph
        if min_node.risk < node.risk
            min_node = node
        end
    end
    return min_node
end


function dijkstra!(graph, start)
    initialize_single_source!(graph, start)
    nodes_visited = []
    nodes_left = []
    for node in graph
        push!(nodes_left, node)
    end

    while length(nodes_left) > 0
        from_node = extract_min!(nodes_left)
        push!(nodes_visited, from_node)
        for to_node in from_node.neighbours
            relax!(from_node, to_node[1], to_node[2])
        end
    end
end

function bellman_ford!(graph,start)
    initialize_single_source!(graph, start)
    for k in 1:(length(graph) - 1)
        for from_node in graph
            for to_node in from_node.neighbours
                relax!(from_node, to_node[1], to_node[2])
            end
        end
    end
    for from_node in graph
        for to_node in from_node.neighbours
            if to_node[1].risk > from_node.risk + to_node[2] / to_node[1].probability
                return false
            end
        end
    end
    return true
end
    


