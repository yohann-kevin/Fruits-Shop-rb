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
      return @symbol[key] if @arg == key
    end
  end

  def all_symbol
    tab_all_symbol = []
    @symbol.each do |_key, value|
      tab_all_symbol << value
    end
    return tab_all_symbol
  end

  def translate_arg
    %w[mel apples].each do |el|
      @arg = "pommes" if el == @arg
    end
  end
end
