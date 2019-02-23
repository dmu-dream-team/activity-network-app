# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/inbox', type: :request do
  describe 'POST /' do
    let(:elk_params) do
      {
        direction: 'incoming',
        id: 'sf8425555e5d8db61dda7a7b3f1b91bdb',
        from: '%2B46706861004',
        to: '%2B46706861020',
        created: '2018-07-13T13%3A57%3A23.741000',
        message: 'Hello%20how%20are%20you%3F'
      }
    end

    it 'responds with an OK message' do
      post '/api/inbox', params: elk_params
      expect(response).to have_http_status(:success)
    end
  end
end
