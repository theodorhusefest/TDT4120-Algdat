
function traversemax(record)
    maxValue = record.value
    while (record.next != nothing)
        record = record.next
        if record.value >= maxValue
            maxValue = record.value
        end
    end
    return maxValue;
end
