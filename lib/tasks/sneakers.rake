# frozen_string_literal: true

namespace :sneakers do
  task run_with_rails: :environment do
    ::Rails.application.eager_load!
    Rake::Task['sneakers:run'].invoke
  end
end
