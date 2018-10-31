
mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end


function findset(x::DisjointSetNode)
    if x != x.p
        findset(x.p)
    end
    return x.p
end


function union!(x::DisjointSetNode, y::DisjointSetNode)
    return link(findset(x),findset(y))
end


function link(x::DisjointSetNode, y::DisjointSetNode)
    if x.rank > y.rank
        y.p = x
    else
        x.p = y
        if x.rank == y.rank
            y.rank += 1
        end
    end
end



