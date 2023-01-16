class Recipe
  attr_reader :title, :url, :country, :image

  def initialize(recipe, country)
    @title = recipe[:recipe][:label]
    @url = recipe[:recipe][:url]
    @country = country
    @image = recipe[:recipe][:image]
  end
end
