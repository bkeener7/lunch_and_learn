require 'rails_helper'

RSpec.describe RecipeService do
  let!(:country) { 'South Korea' }

  it 'tourist sight info', :vcr do
    response = RecipeService.get_recipes(country)

    expect(response[:hits]).to be_an Array
    expect(response[:hits].first).to be_a Hash
    expect(response[:hits].first[:recipe]).to have_key :label
    expect(response[:hits].first[:recipe]).to have_key :url
    expect(response[:hits].first[:recipe]).to have_key :image
  end
end
