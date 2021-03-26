require "pry"
require "./lib/reduction.rb"
require "./lib/price.rb"

def init
  ARGF.each do | arg |
    break if arg.chomp == "quit"
    reduction = Reduction.new
    price = Price.new(reduction)
    price.getPrice(arg.chomp)
  end
end

init