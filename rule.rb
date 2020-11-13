class Rule
  def apply(basket, **args)
    tot = basket_prise(basket)

    if args.has_key?(:item)
      new_arr = basket.select { |it| it[:name] == args[:item] }
      if new_arr.length >= args[:quantity]
        z = new_arr.inject(0) { |sum, it| sum += it[:price] }
        return z - args[:total_price]
      end
      0
    elsif args.has_key?(:basket_total)
      if tot >= args[:basket_total]
        return args[:discount]
      end
      0
    end
  end

  def basket_prise(basket)
    val = 0
    basket.each do |it|
      val += it[:price]
    end
    val
  end
end
