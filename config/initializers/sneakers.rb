# frozen_string_literal: true

require 'sneakers'

Sneakers.configure amqp: Rails.application.config.rmq_uri,
                   workers: 1,
                   hooks: {
                     before_fork: lambda do
                       Rails.logger.error('Sneakers: Disconnecting from database')
                       ActiveRecord::Base.connection_pool.disconnect!
                     end,
                     after_fork: lambda do
                       config = Rails.application.config.database_configuration[Rails.env]
                       # 1 connection for incoming_listener
                       # 2 connections for general buffer
                       # In the Land of Mordor where the Shadows lie
                       config['pool'] = ENV.fetch('SNEAKERS_ARTICLES_THREADS', 1).to_i + 1 + 2
                       config['timeout'] = 20_000
                       config['variables'] = { statement_timeout: 120_000 }
                       Rails.logger.error("Sneakers: Reconnecting to database with config: #{config}")
                       ActiveRecord::Base.establish_connection(config)
                     end
                   }

Sneakers.logger.level = Logger::INFO
