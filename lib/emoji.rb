class Emoji
  def initialize(arg)
    @arg = arg
    @symbol = {
      "cerises" => "\u{1F352}",
      "fraises" => "\u{1F353}",
      "kiwi" => "\u{1F95D}",
      "pommes" => "\u{1F34F}",
      "bananes" => "\u{1F34C}",
      "poires" => "\u{1f350}"
    }
  end

  def check_arg
    translate_arg
    @symbol.each_key do |key, _value|
      puts @arg
      puts key
      return @symbol[key] if @arg == key
    end
  end

  def translate_arg
    %w[mel apples].each do |el|
      return @arg = el if el == @arg
    end
  end
end
