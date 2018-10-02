
struct Node
    children::Dict{Char,Node}
    posi::Array{Int}
end

Node() = Node(Dict(),[])

function parse_string(sentence)
    list_of_words = []
    temp = 1

    for i in 1:length(sentence)
        if sentence[i] == ' '
            push!(list_of_words, (sentence[temp:i-1], temp))
            temp = i + 1
        end
    end
    push!(list_of_words, (sentence[temp:end], temp))
end




function build(list_of_words)

    char_list = Array{Char}
    top_node = Node()

    for i in 1:length(list_of_words)                                    # Tar et og et ord om gangen
        current_node = top_node                                         # Begynner på toppen for hvert ord

        for j in 1:length(list_of_words[i][1])
            current_char = list_of_words[i][1][j]

            if get(current_node.children, current_char, 0) == 0         # Sjekker om noden finnes
                new_node = Node()                                       # Lager ny node om den ikke finnes
                current_node.children[current_char] = new_node          # Legger den nye noden i children til forrige node
                current_node = new_node

            else
                current_node = current_node.children[current_char]
            end
        end
        push!(current_node.posi, list_of_words[i][2])
    end
    return top_node
end


function positions(word, node, index=1)
    
    global posi_list = Array{Any}
    temp_list = Array{Any}
    if index <= length(word)
        if get(node.children, word[index], 0) == 0
            println("Går her ja")
            return node.posi
        else
            new_node = node.children[word[index]]
            positions(word, new_node, index + 1)
            println(" Men den går her")
        end
    end

    temp_list = node.posi
    print(temp_list)
    #append!(posi_list,temp_list)
    return posi_list
end






println()
println("********** NY KJØRING ***********")
println()

word_list = parse_string("en ei et")
top_node = build(word_list)

position = []
position = positions("en", top_node)
println(length(position))

