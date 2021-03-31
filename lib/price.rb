require "./db/database"
require "./lib/emoji.rb"

class Price
  $sum = 0
  $basket = []
  $db = Database.new

  def self.instance(arg)
    @price ||= Price.new(arg)
  end

  def initialize(reduction)
    @fruits = find_data
    @reduction = reduction
  end

  def find_data
    result = {}
    data = $db.find_products
    i = 0
    while i < data.length
      result [data[i][1].to_s.downcase] = data[i][2]
      i += 1
    end
    result
  end

  def get_price(arg)
    puts @fruits
    all_article = arg.split(", ")
    if all_article.length == 1
      entry = arg.to_s.downcase
      # compute_cents(@fruits[entry], entry) if test_value(entry)
      test_value(entry) ? compute_cents(@fruits[entry], entry) : manage_error
    else
      all_article.each do |el|
        get_price(el)
      end
    end
  end

  def test_value(entry)
    @fruits.each_key do |key, _value|
      if entry == key
        $basket << entry.to_s
        return true
      end
    end
    false
  end

  def compute_cents(fruits, entry)
    result = fruits
    result -= @reduction.check_entry(entry, @fruits)
    $sum += result
    # generate_symbol
    symbol = Emoji.new(entry).check_arg
    "vous devez payer #{$sum} centime  #{symbol}"
  end

  def generate_symbol(entry)
    symbol = Emoji.new(entry).check_arg
    return symbol
  end

  def manage_error
    "Invalid product !"
  end

  def find_basket
    arr = []
    $basket.each do |el|
      arr << generate_symbol(el)
    end
    arr
  end
end
