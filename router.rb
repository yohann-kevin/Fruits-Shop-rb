require "./lib/controller"

class Router
  $basket_ui = ""
  $result = ""

  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)
    body = req.body.gets

    params = {}
    params.merge!(body ? JSON.parse(body) : {})
    roots(path, params)
  end

  def roots(path, params)
    case path
    when "/"
      controller.post_data
    when "/add"
      controller.add(params)
    when "/select"
      controller.select(params)
    when "/page_connect"
      controller.page_connect
    else
      controller.not_found
    end
  end
end
