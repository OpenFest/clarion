class Api::ApplicationController < ::ApplicationController
  def set_access_control_headers
    if request.format.json?
      response.headers['Access-Control-Allow-Origin'] = '*'
    end
  end
end
