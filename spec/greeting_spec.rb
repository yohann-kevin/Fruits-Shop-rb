require "spec_helper"
require "greeting"

RSpec.describe Greeting do 
  describe "#hello" do
    it "return 'Hello Wolrd !'" do
      greeting = Greeting.new
      expect(greeting.hello).to eql("Hello World !")
    end    
  end
    
  describe "#goodbye", :bye do
    it "return 'Goodbye plop !'" do
      greeting = described_class.new
      name = "plop"
      expect(greeting.goodbye(name)).to eql("Goodbye #{name} !")
    end
  end
    
end