class Api::V1::UsersController < ApplicationController
  respond_to :json

  def create
    new_user = User.create(user_params)
    new_user[:api_key] = User.generate_api_key
    if new_user.save
      respond_with json: UserSerializer.new(new_user), status: 201
    else
      respond_with json: { message: new_user.errors.full_messages.to_sentence }, status: 400
    end
  end
end

private

def self.generate_api_key
  Faker::Internet.password
end

def user_params
  params.permit(:name, :email, :api_key)
end
