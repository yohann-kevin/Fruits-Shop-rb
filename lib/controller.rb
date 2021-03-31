require "tilt"
require "erb"

require "./lib/price"
require "./lib/reduction"
require "./lib/priceformat"

class Controller
  $basket_ui = ""
  $result = ""
  $isEuro = false

  def index
    template = Tilt.new("./views/index.html.erb")
    [200, { "Content-Type" => "text/html" }, template.render(
      self,
      basket: $basket_ui,
      result: $result
    )]
  end

  def add(params)
    reduction = Reduction.instance
    price = Price.instance(reduction)
    price.convert_euro($isEuro)
    $result = price.get_price(params.values[0])
    $basket_ui = price.find_basket
    [302, { "Location" => "/" }, []]
  end

  def select(params)
    form = Priceformat.new(params.values[0])
    $isEuro = form.check_format
    [302, { "Location" => "/" }, []]
  end

  def not_found
    template = Tilt.new("./views/not_found.html.erb")
    [404, { "Content-Type" => "text/html" }, template.render]
  end
end
