# frozen_string_literal: true

module Api
  module Messages
    module V1
      class MessagesController < ApiController
        def create
          Rails.logger.info("#{self.class}: Incoming request: #{params}.")
          SmsInbox.create(elk_params)
          head 200
        end

        private

        def elk_params
          params.permit(:from, :message)
        end
      end
    end
  end
end
