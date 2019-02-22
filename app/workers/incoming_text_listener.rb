# frozen_string_literal: true

require 'sneakers'

class IncomingTextListener
  include Sneakers::Worker

  from_queue 'TAN_incoming_texts',
             exchange: 'TAN_incoming_texts',
             exchange_type: 'fanout',
             threads: 1,
             bind_arguments: {
               routing_key: 'TAN_incoming_texts'
             }

  def work(msg)
    Rails.logger.error "#{self.class}: Received message: #{msg}"
    TextRouter.route_text(msg)
    ack!
  rescue StandardError => e
    Rails.logger.error("#{self.class}: Caught error: #{e}.")
    e.backtrace.each { |line| Rails.logger.error("#{self.class}: #{line}") }
    ack!
    # ensure
    # Gotcha: It doesn't seem possible to ack from an ensure block.
    # Sneakers might have implemented ack in some special way.
  end
end
