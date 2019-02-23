# frozen_string_literal: true

require 'sneakers'

class IncomingTextListener
  include Sneakers::Worker

  from_queue 'TAN-messages',
             exchange: 'TAN-messages',
             exchange_type: 'fanout',
             threads: 1,
             bind_arguments: {
               routing_key: 'TAN-messages'
             }

  def work(msg)
    Rails.logger.info "#{self.class}: Received message: #{msg}"

    parsed_message = JSON.parse msg, symbolize_names: true
    MessageRouter.process parsed_message
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
