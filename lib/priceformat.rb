class Priceformat
  def initialize(arg)
    @value = arg
  end

  def check_format
    case @value
    when "euro"
      return "euro"
    when "centime"
      return "centime"
    when "yen"
      return "yen"
    when "livre"
      return "livre"
    when "yuan"
      return "yuan"
    else
      return "dollar"
    end
  end
end
