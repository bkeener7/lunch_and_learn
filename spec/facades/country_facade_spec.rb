require 'rails_helper'

RSpec.describe CountryFacade do
  describe 'Country', :vcr do
    let!(:countries) { CountryFacade.countries }
    let!(:random_country) { CountryFacade.random_country }

    it 'exists' do
      expect(CountryFacade.new).to be_an_instance_of(CountryFacade)
    end

    it 'returns an array of countries' do
      expect(countries).to be_an Array
      expect(countries.first.name).to be_a String
    end

    # This API call is limited to 250 countries, calling the CountryFacade separately as seen in lines 5 & 6 most times will not result in overlapping sample sets.
    # Below tests the random_country method as if the method is being called on the same API call.
    it 'can return a random country from API call' do
      expect(countries).to include(countries.sample)
      expect(random_country).to be_a String
    end
  end
end
