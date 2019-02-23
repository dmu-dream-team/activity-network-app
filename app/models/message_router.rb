# frozen_string_literal: true

class MessageRouter
  def self.process(payload)
    user = User.find(payload[:user_id])
    case payload[:type]
    when '0-start'
      # Send a messsage back with "what do you like"

      # Update the user-state to '1-select-interests'
      user.update(state: '1-select-interests');
    when '1-select-interests'
      # Save interests for user (example of linking interests to user in interests.rake)
      # processed_message = process_message(params[:message])
      # interest = processed_message.map { |part| Interest.new(name: part) }
      # user.interests << process_message(params[:message])
      # Update the user-state to '2-select-location'
      user.update(state: '2-select-location');
    when '2-select-location'
      # Save location for user
      # user.locations << params[:message].split()
      # TODO: Should the user-state really change to 'finished' here?
      user.update(state: 'finished');
    end
  end

  private

  def process_message(message)
    # TODO: Is \W safe? What do we get here?
    message.split(/\W/).reject(&:empty?)
  end
end
