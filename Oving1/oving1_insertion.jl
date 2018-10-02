
function insertionsort!(list)
    i = 1
    for j in 2:length(list)
        key = list[j]
        i = j - 1

        while ((i > 0) && (list[i] > key))
            list[i + 1] = list[i]
            i = i - 1
        end
        list[i + 1] = key
    end
end

insertionSort(list)
