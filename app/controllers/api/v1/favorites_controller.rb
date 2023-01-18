class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, only: [:create, :index]

  def index
    if @user
      render json: FavoriteSerializer.new(@user.favorites), status: :ok
    else
      render json: { message: 'API key not valid' }, status: :bad_request
    end
  end

  def create
    if @user.nil?
      render json: { message: 'API key not valid' }, status: :bad_request
    else
      new_favorite = @user.favorites.new(favorite_params)
      if new_favorite.save
        render json: { "success": 'Favorite added successfully' }, status: :created
      else
        render json: { message: new_favorite.errors.full_messages.to_sentence }, status: :bad_request
      end
    end
  end
end

private

def find_user
  @user = User.find_by(api_key: params[:api_key])
end

def favorite_params
  params.permit(:country, :recipe_link, :recipe_title)
end
