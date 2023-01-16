require 'rails_helper'

RSpec.describe Recipe do
  let!(:recipe_data) do
    { recipe:
    {
      label: 'Creme Caramel',
      url: 'http://www.edamam.com/ontologies/edamam.owl#recipe_c705f9183afa697551f614b773669a98',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB_w97DRzLt2NKJP-7ypiIi4GshyMz8WM3Fym6EV88IhuiFAvit_ghqp4B3_gPHlNhWtQ&usqp=CAU'
    } }
  end
  let!(:country) { 'Vietnam' }
  let!(:recipe) { Recipe.new(recipe_data, country) }

  it 'exists and has attributes' do
    expect(recipe).to be_an_instance_of(Recipe)
    expect(recipe.title).to eq('Creme Caramel')
    expect(recipe.url).to eq('http://www.edamam.com/ontologies/edamam.owl#recipe_c705f9183afa697551f614b773669a98')
    expect(recipe.country).to eq('Vietnam')
    expect(recipe.image).to eq('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB_w97DRzLt2NKJP-7ypiIi4GshyMz8WM3Fym6EV88IhuiFAvit_ghqp4B3_gPHlNhWtQ&usqp=CAU')
  end
end
