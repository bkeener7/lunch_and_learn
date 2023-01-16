require 'rails_helper'

RSpec.describe CountryService do
  it 'returns a list of countries', :vcr do
    response = CountryService.get_countries

    expect(response).to be_an Array
    expect(response.first).to be_a Hash
    expect(response.first).to have_key(:name)
    expect(response.first[:name]).to be_a Hash
    expect(response.first[:name]).to have_key(:common)
    expect(response.first[:name][:common]).to be_a String
  end
end
