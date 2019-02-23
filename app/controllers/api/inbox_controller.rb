# frozen_string_literal: true

class Api::InboxController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    SmsInbox.receive(elk_params)
    head :ok, content_type: 'text/html'
  end

  private

  def elk_params
    params.permit(:from, :message)
  end
end
