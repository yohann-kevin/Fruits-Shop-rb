require "./db/database"

class Price
  $sum = 0
  $basket = []
  $db = Database.new()

  def self.instance(arg)
    @price ||= Price.new(arg)
  end

  def initialize(reduction)
    #@fruits = {
    #  "apple" => 1,
    #  "apfel" => 1,
    #  "pommes" => 1,
    #  "banana" => 1.50,
    #  "cherry" => 0.75
    #}
    @fruits = get_data()
    @reduction = reduction
  end

  def get_data
    result = {}
    data = $db.get_products()
    #puts data[0]
    #puts data[0][1]
    i = 0
    while i < data.length
      #result += { data[i][1].to_s => data[i][2]}
      result [data[i][1].to_s] = data[i][2]
      i += 1
    end
    return result
    #puts data
  end

  def get_price(arg)
    puts @fruits
    all_article = arg.split(", ")
    if all_article.length == 1
      entry = arg.to_s
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
      else
        #puts key
      end
    end
    false
  end

  def compute_cents(fruits, entry)
    result = fruits * 100
    result -= @reduction.check_entry(entry, @fruits)
    #puts "#{result} centime"
    $sum += result
    #puts "vous devez payer #{$sum} centime"
    return "vous devez payer #{$sum} centime"
  end
end
