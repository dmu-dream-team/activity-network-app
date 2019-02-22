class ApiController < ApplicationController
  before_action :verify_token
  skip_before_action :verify_authenticity_token

  def verify_token
    head 403 unless params['token'] == Rails.application.config.static_token
  end
end
