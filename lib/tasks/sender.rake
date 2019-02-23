# frozen_string_literal: true

namespace :sender do
  desc 'send fake messages to phone_number'
  task fake: :environment do
    phonenumber = '+46725587079'
    
    FakeMessages.all.each do |message|
      puts "Ready for message?"
      input = STDIN.gets
      SmsGateway.send(to: phonenumber, message: message)
      puts "#{message} #{input}"
    end
  end
end
