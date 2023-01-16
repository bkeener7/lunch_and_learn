require 'rails_helper'

RSpec.describe RecipeFacade do
  describe 'Recipe', :vcr do
    let!(:country) { 'South Korea' }
    let(:recipes) { RecipeFacade.recipes(country) }

    it 'exists' do
      expect(RecipeFacade.new).to be_an_instance_of(RecipeFacade)
    end

    it 'returns recipes from the chosen country' do
      expect(recipes).to be_an Array
      expect(recipes.first.title).to be_a String
      expect(recipes.first.url).to be_a String
      expect(recipes.first.country).to be_an String
      expect(recipes.first.image).to be_an String
    end
  end
end
