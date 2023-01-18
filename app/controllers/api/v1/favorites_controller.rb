class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { message: 'API key not valid' }, status: :bad_request
    else
      new_favorite = user.favorites.new(favorite_params)
      if new_favorite.save
        render json: { "success": 'Favorite added successfully' }, status: :created
      else
        render json: { message: new_favorite.errors.full_messages.to_sentence }, status: :bad_request
      end
    end
  end
end

private

def favorite_params
  params.permit(:country, :recipe_link, :recipe_title)
end
