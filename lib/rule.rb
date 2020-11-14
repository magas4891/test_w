class Rule
  def apply(basket, **args)
    total_price = basket.inject(0) { |sum, item| sum += item[:price] }

    if args.has_key?(:item)
      multi_price(basket, args)
    elsif args.has_key?(:basket_total)
      return args[:discount] if total_price >= args[:basket_total]
      0
    end
  end

  def multi_price(basket, **args)
    items_arr = basket.select { |item| item[:name] == args[:item] }
    if items_arr.length >= args[:quantity]
      value = items_arr.inject(0) { |sum, it| sum += it[:price] }
      return value - args[:total_price]
    end
    0
  end
end
