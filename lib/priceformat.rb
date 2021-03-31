class Priceformat
  def initialize(arg)
    @value = arg
    @money = {
      "cents" => true,
      "euro" => false,
      "dollars" => false
    }
    @symbol = {
      "cents" => " centimes",
      "euro" => "€",
      "dollars" => "$"
    }
    @price = 0
    @money_value = ""
  end

  def check_format(price)
    @price = price
    @money.each_key do |key, _value|
      if @value == key && key != "cents"
        @money[key] = true
        @money_value = key
        return convert_euro
      end
    end
    return @price
  end

  def convert_euro
    @money["cents"] = false
    @money["euro"] = true
    puts @money
    @price = (@price /= 100.0).round(2)
    if @money_value == "euro"
      puts "plop : #{@price}"
      return @price
    else
      return check_value
    end
  end

  def check_value
    case @money_value
    when "dollars"
      return convert_dollars
    end
  end

  def convert_dollars
    @money["euro"] = false
    @money["dollars"] = true
    @price = (@price *= 1.174185).round(2)
    return @price
  end


  def check_symbol
    @money.each_key do |key, _value|
      return @symbol[key] if @money[key] == true
    end
  end
end
