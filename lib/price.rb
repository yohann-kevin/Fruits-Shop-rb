require "./db/database"
require "./lib/emoji.rb"

class Price
  $sum = 0
  $basket = []
  $db = Database.new
  $format = "centime"
  $euro = false
  $dollar = false
  $yen = false
  $livre = false
  $yuan = false

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
    result = result /= 100.0 if $euro
    result = result *= 1.174185 if $dollar
    result = result *= 130.01 if $yen
    result = result *= 0.85 if $livre
    result = result *= 7.68 if $yuan
    $sum += result
    symbol = Emoji.new(entry).check_arg
    "vous devez payer #{$sum.round(2)} #{$format}  #{symbol}"
  end

  def generate_symbol(entry)
    Emoji.new(entry).check_arg
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

  def convert(value)
    case value
    when "euro"
      $format = "€"
      $euro = true
    when "dollar"
      $format = "$"
      $euro = true
      $dollar = true
    when "yen"
      $format = "¥"
      $euro = true
      $yen = true
    when "livre"
      $format = "£"
      $euro = true
      $livre = true
    when "yuan"
      $format = "¥"
      $euro = true
      $yuan = true
    else
      $format = "centime"
      $euro = false
      $dollar = false
    end
  end
end
