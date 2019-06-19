def stock_picker(stocks)
  raise ArgumentError if stocks.empty?
  return_arr = [0, 0]
  big_dif = 0
  (0...stocks.length).each do |i1|
    (0...stocks.length).each do |i2|
      if stocks[i2] - stocks[i1] >= big_dif && i2 >= i1
      return_arr = [i1,i2]
      big_dif = stocks[i2] - stocks[i1]
      end
    end
  end
  return_arr
end