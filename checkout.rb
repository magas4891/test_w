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
    @basket.each do |item|
      @total += item[:price]
    end
    @rules.each do |rule|
      rule_applied = Rule.new.apply(@basket, rule)
      @total -= rule_applied
    end
    @total
  end
end