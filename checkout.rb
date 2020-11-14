class Checkout
  attr_accessor :rules, :basket, :total_price

  def initialize(rules)
    @rules = rules
    @basket = []
    @total_price = 0
  end

  def scan(item)
    @basket << item
    @total_price = @basket.inject(0) { |sum, item| sum += item[:price] }
  end

  def total
    @rules.map do |rule|
      rule_applied = Rule.new.apply(@basket, rule)
      @total_price -= rule_applied
    end
    @total_price
  end
end