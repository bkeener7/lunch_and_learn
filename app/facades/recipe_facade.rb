class RecipeFacade
  def self.recipes(country)
    RecipeService.get_recipes(country)[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end
