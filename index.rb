require_relative 'rule'
require_relative 'checkout'
require_relative 'item_list'
require_relative 'rules'

co = Checkout.new(@rules)
co.scan(@item_list[:A])
co.scan(@item_list[:B])
co.scan(@item_list[:A])
co.scan(@item_list[:A])
price = co.total
puts price