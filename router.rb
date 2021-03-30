require "tilt"
require "erb"
require "./lib/reduction"
require "./lib/price"
#require "event"

class Router
  $basket_ui = ""
  $result = ""

  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params
    product = params.values[0]
    reduc = Reduction.instance
    #product = params.POST()["product"]

    case path
      when "/"
        template = Tilt.new('index.html.erb')
        puts "/ : #{params.values[0]}"
        [200, {"Content-Type" => "text/html"}, template.render(
          self,
          plop: "plop",
          product: $basket_ui,
          result: $result,
          reduction: reduc,
          price: Price.instance(reduc)
        )]
      when "/add"
        reduction = Reduction.instance
        price = Price.instance(reduction)
        $basket_ui += " #{params.values[0] }"
        $result  = price.get_price(params.values[0])
        [302, {'Location' => "/"}, []]
      else
        template = Tilt.new('not_found.html.erb')
        [404, {"Content-Type"=>"text/html"}, template.render]
      end
  end


end
