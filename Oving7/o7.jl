
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


coins = [1000, 500, 100, 20, 5, 1]

min_coins_greedy(coins, 1226)
