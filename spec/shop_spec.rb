require "spec_helper"
require "price"
require "reduction"

RSpec.describe Price do
  it "return 580" do
    reduction = Reduction.new
    price = Price.new(reduction)
    arg = "apfel, apple, apple, pommes, apple, apfel, cherry, cherry"
    expect(price.get_price(arg)).to eql(580)
  end
end
