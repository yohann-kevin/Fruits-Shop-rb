require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www.coingecko.com/en"))
puts page.css('span[data-coin-symbol="btc"]').text
puts page.css("span[data-coin-id='1']").css("span[data-target='percent-change.percent']").text