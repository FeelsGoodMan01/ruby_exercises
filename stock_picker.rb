def stock_picker (array)
    max_profit = 0
    buy = 0
    sell = 0
    array[0..-2].each_index do |buy_date|
        sell_array = array[1+buy_date..-1]
        sell_array.each_index do |sell_date|
            profit = sell_array[sell_date] - array[buy_date] 
            if profit > max_profit
                buy = buy_date
                sell = sell_date + buy_date + 1
                max_profit = profit
            end
        end
    end
    puts "You need to buy at day #{buy + 1} and sell at day #{sell + 1}. Your profit will be #{max_profit} bucks!"
    [buy, sell]
end
stock_picker([17,3,6,9,15,8,6,1,10])