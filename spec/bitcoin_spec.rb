require "spec_helper"
require "bitcoin"

RSpec.describe Bitcoin do
  it "return 0.000017" do
    bitcoin = Bitcoin.new(1)
    expect(bitcoin.format_for_spec).to eql("0.000017")
  end
end