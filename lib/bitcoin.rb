require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Bitcoin
  def initialize(initial_value)
    @initial_value = initial_value.to_f
  end

  def get_bitcoin_value
    $html_element = Nokogiri::HTML(URI.open("https://www.coingecko.com/en"))
    $bitcoin_price = $html_element.css('span[data-coin-symbol="btc"]').text
    puts $bitcoin_price
    convert_to_integer
  end

  def convert_to_integer
    tab = $bitcoin_price.split("")
    tab.delete("$")
    tab.delete(",")
    $bitcoin_value = tab.join("").to_f
    convert_to_bitcoin
  end

  def convert_to_bitcoin
    $result = (@initial_value /= $bitcoin_value)
    # $result = "%f" % $result
    # puts $result.class
  end

  def format_for_spec
    get_bitcoin_value
    $result = "%f" % $result
  end
end
