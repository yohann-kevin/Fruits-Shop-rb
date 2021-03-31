require "./db/database"
require "./lib/emoji"
require "./lib/priceformat"

class Price
  $sum = 0
  $basket = []
  $db = Database.new
  $format_money = "cents"
  $format_change = false

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

  def get_price(arg, money_format, format_change)
    init(money_format, format_change)
    all_article = arg.split(", ")
    check_all_article(arg, all_article)
  end

  def init(money_format, format_change)
    $format_money = money_format
    $format_change = format_change
  end

  def check_all_article(arg, all_article)
    if all_article.length == 1
      entry = arg.to_s.downcase
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

  # !Refactoring
  def compute_cents(fruits, entry)
    result = fruits
    result -= @reduction.check_entry(entry, @fruits)
    result_format = Priceformat.new($money_format)
    result = result_format.check_format(result)
    symbol = result_format.check_symbol
    $sum = result_format.check_format($sum) if $format_change
    $sum = $sum + result
    $sum.to_i.round(2)
    fruitmoji = Emoji.new(entry).check_arg
    "vous devez payer #{$sum}#{symbol} #{fruitmoji}"
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
end
