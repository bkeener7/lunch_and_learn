class Api::V1::RecipesController < ApplicationController
  def show
    recipes = RecipeFacade.recipes(params[:country])
    render json: RecipeSerializer.new(recipes)
  end
end
