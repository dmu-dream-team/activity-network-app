# frozen_string_literal: true

class QueueUtil
  def self.send(type, message, user_id)
    payload = {
      message: message,
      type: type,
      user_id: user_id
    }.to_json

    publish(key, payload)
  end

  private

  def publish(key, payload)
    conn = Bunny.new Rails.application.config.rmq_uri
    conn.start
    channel = conn.create_channel
    exchange = channel.fanout 'TAN-messages', durable: true

    uuid = SecureRandom.uuid
    Rails.logger.error "QueueUtil.send: Incoming message (ID: #{uuid}): #{message}"

    exchange.publish(
      payload,
      message_id: uuid,
      routing_key: "TAN-#{key}"
    )
  ensure
    conn.close
  end
end
