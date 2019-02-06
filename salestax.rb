# $LOAD_PATH << '.'
# require "exempted_goods"

goods = Hash.new
goods["pills"] = "medical"
goods["chocolates"] = "food"
goods["books"] = "books"
goods["milk"] = "food"

class Sales
  attr_accessor :goods_count, :goods_price, :total_tax, :total_price 
  def initialize(val) 
    @goods_count = val
    @goods_price = val
    @total_tax = val
    @total_price = val
  end

  def cal_tax(type, imp)
    temp = ((goods_count * goods_price) * 0.1) * type + ((goods_count * goods_price) * 0.05) * imp
    self.total_tax += temp
    self.total_price += total_tax + (goods_count * goods_price)
  return temp
  end

end

inputs = IO.readlines("input.txt")

sales_cal = Sales.new(0)

len = inputs.length
result = Array.new(len)

for i in (0...len)
  input = inputs[i].split
  count = input[0].to_i
  price = input[input.length - 1].to_f

  type, imp = 1, 0
  input.each do |x| 
    if x == "imported"
      imp = 1
    end
    if goods.has_key?(x) 
      type = 0
    end 
  end

  # print type, imp, "\n"
  
  sales_cal.goods_count = count
  sales_cal.goods_price = price 
  total = sales_cal.cal_tax(type, imp) + (count * price)

  input[input.length-1] = total
  inputs[i] = input

end 

inputs = inputs.collect {|line| line.join(' ')}


inputs[len] = [""]
puts inputs