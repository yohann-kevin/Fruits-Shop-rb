require "spec_helper"
require "priceformat"

RSpec.describe Priceformat do
  it "return 1.0" do
    price_format = Priceformat.new("euro")
    expect(price_format.check_format(100)).to eql(1.0)
  end

  it "return 1.17" do
    price_format = Priceformat.new("dollars")
    expect(price_format.check_format(100)).to eql(1.17)
  end

  it "return 130.01" do
    price_format = Priceformat.new("yen")
    expect(price_format.check_format(100)).to eql(130.01)
  end

  it "return 0.85" do
    price_format = Priceformat.new("livre")
    expect(price_format.check_format(100)).to eql(0.85)
  end

  it "return 7.68" do
    price_format = Priceformat.new("yuan")
    expect(price_format.check_format(100)).to eql(7.68)
  end

  it "return $" do
    price_format = Priceformat.new("dollars")
    price_format.check_format(100)
    expect(price_format.check_symbol).to eql("$")
  end

  # it "return £" do
  #   price_format = Priceformat.new("livre")
  #   price_format.check_format(100)
  #   expect(price_format.check_symbol).to eql("£")
  # end
end
