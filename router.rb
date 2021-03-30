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
    case path
    when "/"
      controller.index
    when "/add"
      controller.add(params)
    else
      controller.not_found
    end
  end
end
