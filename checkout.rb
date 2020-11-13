class Checkout
  def initialize(rules)
    @rules = rules
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    @total = @basket.inject(0) { |sum, item| sum += item[:price] }
    @rules.map do |rule|
      rule_applied = Rule.new.apply(@basket, rule)
      @total -= rule_applied
    end
    @total
  end
end