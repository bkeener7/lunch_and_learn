class Api::V1::LearningResourcesController < ApplicationController
  def show
    recipes = RecipeFacade.recipes(params[:country] || CountryFacade.random_country)
    render json: RecipeSerializer.new(recipes)
  end
end
