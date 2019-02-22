Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'start_page#index'

  namespace :api do
    namespace :users do
      namespace :v1 do
        post '/' => 'users#create'
      end
    end
  end
end
