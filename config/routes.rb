# frozen_string_literal: true

Rails.application.routes.draw do
  root 'start_page#index'

  namespace :api do
    # namespace :users do
    #   namespace :v1 do
    #     post '/' => 'users#create'
    #   end
    # end
    # namespace :messages do
    #   namespace :v1 do
    #     post '/' => 'messages#create'
    # end

    post 'inbox', to: 'inbox#create'
  end
end
