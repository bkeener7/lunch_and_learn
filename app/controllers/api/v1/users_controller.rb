class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create(user_params)
    new_user[:api_key] = User.generate_unique_secure_token
    if new_user.save
      render json: UserSerializer.new(new_user), status: :created
    else
      render json: { message: new_user.errors.full_messages.to_sentence }, status: :bad_request
    end
  end
end

private

def user_params
  params.permit(:name, :email, :api_key)
end
