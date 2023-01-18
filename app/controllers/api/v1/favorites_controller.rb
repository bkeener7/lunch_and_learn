class Api::V1::FavoritesController < ApplicationController
  def create
    new_favorite = Favorite.find_or_initialize_by(favorite_params)
    user = User.find_by_api_key(params[:api_key])
    if new_favorite.save && user
      render json: { "success": "Favorite added successfully" }, status: :created
    else
      render json: { message: new_favorite.errors.full_messages.to_sentence }, status: :bad_request
    end
  end
end

private

def favorite_params
  params.permit(:api_key, :country, :recipe_link, :recipe_title)
end
