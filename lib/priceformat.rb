class Priceformat
  $cents = true
  $euro = false
  $yen = false
  $dollar = false
  $livre = false
  $yuan = false

  def initialize(arg)
    @value = arg
    @money = {
      "cents" => true,
      "euro" => false,
      "dollars" => false
    }
    @price = 0
    @money_value = ""
  end

  # def check_format
  #   puts @value
  #   # check_format2
  #   case @value
  #   when "euro"
  #     $euro = true
  #     return "euro"
  #   when "centime"
  #     return "centime"
  #   when "yen"
  #     $yen = true
  #     return "yen"
  #   when "livre"
  #     $livre = true
  #     return "livre"
  #   when "yuan"
  #     $yuan = true
  #     return "yuan"
  #   else
  #     $dollar = true
  #     return "dollar"
  #   end
  # end

  def check_format(price)
    @price = price
    @money.each_key do |key, _value|
      if @value == key && key != "cents"
        @money[key] = true
        @money_value = key
        return convert_euro
      end
    end
    return "#{@price} centimes"
  end

  def convert_euro
    @money["cents"] = false
    @money["euro"] = true
    puts @money


    puts "price : #{@price}"
    @price = @price /= 100.0
    if @money_value == "euro"
      return "#{@price}€"
    else
      return check_value
    end

    
  end

  def check_value
    puts "key : #{@money_value}"
    puts "price : #{@price}"


    case @money_value
    when "dollars"
      return convert_dollars
    end
  end

  def convert_dollars
    @price = (@price *= 1.174185).round(2)
    return "#{@price}$"
  end
end
