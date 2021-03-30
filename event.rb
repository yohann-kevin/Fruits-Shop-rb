require "./lib/reduction.rb"
require "./lib/price.rb"

class Event

  def initialize(arg)
    @arg = arg
  end

  def manageEvent
    reduction = Reduction.new
    price = Price.new(reduction)
    price.get_price(@arg)
  end
  
end