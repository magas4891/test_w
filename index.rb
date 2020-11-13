require_relative 'rule'
require_relative 'checkout'
require_relative 'item_list'

rule1 = {
    item: 'A',
    quantity: 3,
    total_price: 75
}
rule2 = {
    basket_total: 150,
    discount: 20
}
rules = [rule1, rule2]

co = Checkout.new(rules)
co.scan(@item_list[:A])
co.scan(@item_list[:B])
co.scan(@item_list[:A])
co.scan(@item_list[:A])
price = co.total
puts price