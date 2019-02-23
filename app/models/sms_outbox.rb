# frozen_string_literal: true

require 'net/http'

class SmsOutbox
  class << self
    def create(params)
      raise MissingToParameter unless params[:to].present?
      raise MissingMessageParameter unless params[:message].present?
      to = params[:to]
      message = params[:message]

      uri = URI('https://api.46elks.com/a1/sms')
      req = Net::HTTP::Post.new(uri)
      api_username = Rails.application.config.sms_api_username
      api_password = Rails.application.config.sms_api_password
      req.basic_auth(api_username, api_password)

      req.set_form_data(
        # dryrun: 'yes'
        from: '46766862684',
        to: to,
        message: message
      )

      res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request req
      end
      puts "SmsGateway.send: Result of sending text '#{message}' to '#{to}': #{res.body.inspect}"
      Rails.logger.error "SmsGateway.send: Result of sending text '#{message}' to '#{to}': #{res.body.inspect}"
    end
  end
  class MissingToParameter < StandardError; end
  class MissingMessageParameter < StandardError; end

end
