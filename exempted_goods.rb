module EXEMPTED
	
	class 
	def get_goods_type(type)
		goods = Hash.new("not_ex")
	goods["pills"] = "medical"
	goods["tablets"] = "medical"
	goods["chocolates"] = "food"
	goods["books"] = "books"
	goods["milk"] = "food"
	return goods[type]
	end
end