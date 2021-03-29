require "tilt"
require "erb"

class Router
  def call(env)
    path = env["REQUEST_PATH"]

    case path
      when "/"
        template = Tilt.new('index.html.erb')
        [200, {"Content-Type"=>"text/html"}, template.render]
      else
        template = Tilt.new('not_found.html.erb')
        [404, {"Content-Type"=>"text/html"}, template.render]
      end
  end
end