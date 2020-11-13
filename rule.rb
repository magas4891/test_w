class Rule
  def apply(basket, **args)
    total_price = basket_prise(basket)

    if args.has_key?(:item)
      temp_arr = basket.select { |item| item[:name] == args[:item] }
      if temp_arr.length >= args[:quantity]
        value = temp_arr.inject(0) { |sum, it| sum += it[:price] }
        return value - args[:total_price]
      end
      0
    elsif args.has_key?(:basket_total)
      return args[:discount] if total_price >= args[:basket_total]
      0
    end
  end

  def basket_prise(basket)
    total_price = 0
    basket.inject(0) { |sum, item| sum += item[:price] }
    total_price
  end
end
