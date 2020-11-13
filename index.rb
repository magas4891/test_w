require_relative 'rule'
require_relative 'checkout'

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


item_list = {
    'A': {
        name: 'A',
        price: 30
    },
    'B': {
        name: 'B',
        price: 20
    }
}

co = Checkout.new(rules)
co.scan(item_list[:A])
co.scan(item_list[:B])
co.scan(item_list[:A])
co.scan(item_list[:A])
price = co.total
puts price