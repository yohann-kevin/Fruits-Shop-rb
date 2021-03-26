class Greeting
  attr_reader :name, :other
  def initialize
    @name = []
    @other = "toto"
  end

  def hello
    "Hello World !"
  end

  def goodbye(name)
    "Goodbye #{name} !"
  end
end