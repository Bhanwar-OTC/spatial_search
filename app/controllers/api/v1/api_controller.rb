class Api::V1::ApiController < ApplicationController
  layout none: true

  def render_error(message, status_code = 404)
    render json: { success: false, message: message }, status: status_code
  end

end
