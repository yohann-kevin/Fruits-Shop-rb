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
      compute_cents(@fruits[entry], entry) if test_value(entry)
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
    manage_error
    false
  end

  def compute_cents(fruits, entry)
    result = fruits
    result -= @reduction.check_entry(entry, @fruits)
    $sum += result
    symbol = Emoji.new(entry).check_arg
    "vous devez payer #{$sum} centime  #{symbol}"
  end

  def manage_error
    "Invalid input"
  end
end
