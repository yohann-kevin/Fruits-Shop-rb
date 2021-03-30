require "tilt"
require "erb"
require "./lib/reduction"
require "./lib/price"
require "./lib/controller"

class Router
  $basket_ui = ""
  $result = ""

  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params
    product = params.values[0]
    reduc = Reduction.instance

    case path
      when "/"
        controller.index(params)
      when "/add"
        controller.add(params)
      else
        controller.not_found
      end
  end


end
