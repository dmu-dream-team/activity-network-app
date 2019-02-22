# frozen_string_literal: true

namespace :interests do
  desc 'give all users 2 random interests'
  task test: :environment do
    interests = Interest.all

    User.all.each do |user|
      user.interests << interests.sample(2)
    end
  end
end
