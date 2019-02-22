class ApplicationController < ActionController::Base
  # TODO: Fix security
  protect_from_forgery with: :null_session
end
