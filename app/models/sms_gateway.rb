require 'uri'

class SmsGateway
  class << self
    def receive(params)
      payload = parse(params)
      QueueUtil.send('incoming_texts', payload)
    end

    private

    def parse(params)
      {
        from: URI.unescape(params[:from]),
        message: URI.unescape(params[:message]),
        version: 1
      }.to_json
    end
  end
end
