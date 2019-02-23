# frozen_string_literal: true

require 'uri'

class SmsInbox
  class << self
    def create(params)
      user = User.find_or_create_by(phone_number: params[:from])
      state = user.state || '0-start'
      QueueUtil.send(state, params[:message], user.id)
    end
  end
end
