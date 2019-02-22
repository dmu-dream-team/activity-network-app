module Api
  module Users
    module V1
      class UsersController < ApplicationController
        def create
          user = User.create(phone_number: params[:phone_number])

          unless user.valid?
            return render json: { errors: user.errors.full_messages }, status: 401
          end

          render json: user, status: :ok
        end
      end
    end
  end
end
