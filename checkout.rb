class Checkout
  def initialize(rules)
    @rules = rules
    @basket = []
    @total = 0
  end

  def scan(item)
    @basket << item
  end

  def total
    @basket.each do |it|
      @total += it[:price]
    end
    @rules.each do |rule|
      r = Rule.new.apply(@basket, rule)
      @total -= r
    end
    @total
  end
end