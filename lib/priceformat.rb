class Priceformat
  $money = {
    "cents" => true,
    "euro" => false,
    "dollars" => false,
    "yen" => false,
    "livre" => false,
    "yuan" => false
  }
  $symbol = {
    "cents" => " centimes",
    "euro" => "€",
    "dollars" => "$",
    "yen" => "¥",
    "livre" => "£",
    "yuan" => "¥"
  }

  def initialize(arg)
    @value = arg
    @money = $money
    @symbol = $symbol
    @price = 0
    @money_value = ""
  end

  def check_format(price)
    @price = price
    @money.each_key do |key, _value|
      if @value == key && key != "cents"
        @money_value = key
        @money[key] = true
        convert_euro
      end
    end
    @price
  end

  def convert_euro
    @money["cents"] = false
    @money["euro"] = true
    puts @money
    @price = (@price /= 100.0).round(2)
    if @money_value == "euro"
      @price
    else
      check_value
    end
  end

  def check_value
    case @money_value
    when "dollars"
      convert_dollars
    when "yen"
      convert_yen
    when "livre"
      convert_livre
    when "yuan"
      convert_yuan
    end
  end

  def convert_dollars
    @money["euro"] = false
    @money["dollars"] = true
    @price = (@price *= 1.174185).round(2)
    @price
  end

  def convert_yen
    @money["euro"] = false
    @money["yen"] = true
    @price = (@price *= 130.01).round(2)
    @price
  end

  def convert_livre
    @money["euro"] = false
    @money["livre"] = true
    @price = (@price *= 0.85).round(2)
    @price
  end

  def convert_yuan
    @money["euro"] = false
    @money["yuan"] = true
    @price = (@price *= 7.68).round(2)
    @price
  end

  def check_symbol
    @money.each_key do |key, _value|
      return @symbol[key] if @money[key] == true
    end
  end
end
