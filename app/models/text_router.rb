class TextRouter
  def self.route_text(raw_json)
    Rails.logger.error("TextRouter: Inkommande SMS: #{raw_json}.")
    msg = JSON.parse(raw_json, symbolize_names: true)
    user = User.find_by(phone_number: msg[:from])
    if user
      existing_user(user, msg)
    else
      new_user(msg)
    end
  end

  def self.new_user(msg)
    user = User.create(phone_number: msg[:from])
    Rails.logger.error("TextRouter: User id: #{user.id}.")
  end

  def self.existing_user(user, msg)
    Rails.logger.error("TextRouter: Existing user id: #{user.id}. Message: #{msg}")
  end

end
