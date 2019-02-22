# frozen_string_literal: true

module Api
  module Messages
    module V1
      class MessagesController < ApiController
        def create
          Rails.logger.info("#{self.class}: Incoming request: #{params}.")
          SmsGateway.receive(params)
          head 200
        end
      end
    end
  end
end
