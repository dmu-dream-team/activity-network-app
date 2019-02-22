class QueueUtil
  def self.send(key, payload)
    conn = Bunny.new Rails.application.config.rmq_uri
    begin
      conn.start
      ch = conn.create_channel
      exchange = ch.fanout "TAN_#{key}", durable: true

      uuid = SecureRandom.uuid
      Rails.logger.error "QueueUtil.send: Incoming message (ID: #{uuid}): #{payload}"

      exchange.publish(
        payload,
        message_id: uuid,
        routing_key: "TAN_#{key}"
      )
    ensure
      conn.close
    end
  end
end
