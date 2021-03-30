require "tilt"
require "erb"

require "./lib/price"
require "./lib/reduction"

class Controller
  $basket_ui = ""
  $result = ""

  def index(params)
    #product = params.values[0]
    #reduc = Reduction.instance
    template = Tilt.new('./views/index.html.erb')
    [200, {"Content-Type" => "text/html"}, template.render(
      self,
      product: $basket_ui,
      result: $result
    )]
  end

  def add(params)
    reduction = Reduction.instance
    price = Price.instance(reduction)
    $basket_ui += " #{params.values[0] }"
    $result  = price.get_price(params.values[0])
    [302, {'Location' => "/"}, []]
  end

  def not_found
    template = Tilt.new('./views/not_found.html.erb')
    [404, {"Content-Type"=>"text/html"}, template.render]
  end
end
