# frozen_string_literal: true

class MessageRouter
  def self.process(payload)
    case payload[:type]
    when '0-start'
      # Send a messsage back with "what do you like"
      # Update the user-state to '0-select-interests'
    when '1-select-interests'
      # Save interests for user (example of linking interests to user in tasks)
      # Update the user-state to '2-select-location'
    end
  end
end
