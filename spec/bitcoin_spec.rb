require "spec_helper"
require "bitcoin"

RSpec.describe Bitcoin do
  it "return 1.7219409718634846e-05" do
    bitcoin = Bitcoin.new(1)
    expect(bitcoin.get_bitcoin_value).to eql(1.7219409718634846e-05)
  end
end