class Priceformat
  def initialize(arg)
    @value = arg
  end

  def check_format
    case @value
    when "euro"
      return "euro"
    else
      return "centime"
    end
  end
end
