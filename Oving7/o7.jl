
function can_use_greedy(coins)
    can_use_greedy = true
    
    for i in 1:length(coins)-1
        if coins[i] < coins[i+1]
            return false
        end

        if  coins[i]/coins[i+1] -  floor(Int,(coins[i]/coins[i+1]))  != 0
            return false
        end
    end
    return true
    
end


function min_coins_greedy(coins, value)
    coin_count = 0
    num_of_coin = 0

    for coin in coins
        num_of_coin = floor(Int, value /coin)
        value -= (coin*num_of_coin)
        coin_count += num_of_coin

    end

    return coin_count
end

function min_coins_dynamic(coins, value)
    inf = 1000000000
    table = []
    sub_res = 0

    for i in 1:value+1
        push!(table, inf)
    end
    table[1] = 0
    #println("Table = ", table)

    
    for i in 2:value+1
        for j in 1:length(coins)
            if coins[j] <= i - 1

                println("i = ", i)
                println("j = ", j)
                println("Coins[j] = ", coins[j])
                sub_res = table[i-coins[j]]
                println("sub_res = ", sub_res) 
                
                if (sub_res != inf) .& (sub_res + 1 < table[i])
                    table[i] = sub_res + 1
                    println("Table = ", table)
                
                end
            end
        end
    end

    return table[end]  


end

coins = [4, 3, 1]

#min_coins_greedy(coins, 1226)

min_coins_dynamic(coins, 6)
