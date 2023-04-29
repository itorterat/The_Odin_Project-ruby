def stock_picker(prices)
  return [] if prices.length < 2
  
  best_buy = 0
  best_sell = 1
  
  prices.each_with_index do |buy_price, buy_day|
    prices[buy_day+1..-1].each_with_index do |sell_price, sell_day|
      if (sell_price - buy_price) > (prices[best_sell] - prices[best_buy])
        best_buy = buy_day
        best_sell = buy_day + sell_day + 1
      end
    end
  end
  
  [best_buy, best_sell]
end