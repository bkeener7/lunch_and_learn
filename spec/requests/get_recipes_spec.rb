require 'rails_helper'

RSpec.describe 'Get Recipes Info' do
  describe 'Recipe API requests', :vcr do
    it 'returns recipes from the country chosen by the user' do
      country = 'Morocco'
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_an Array
      expect(parsed_response[:data].count).to be > 0
      expect(parsed_response[:data].first).to be_a Hash
      expect(parsed_response[:data].first).to have_key(:id)
      expect(parsed_response[:data].first[:id]).to eq(nil)
      expect(parsed_response[:data].first).to have_key(:type)
      expect(parsed_response[:data].first[:type]).to eq('recipe')
      expect(parsed_response[:data].first).to have_key(:attributes)
      expect(parsed_response[:data].first[:attributes]).to be_a Hash
      expect(parsed_response[:data].first[:attributes]).to have_key(:title)
      expect(parsed_response[:data].first[:attributes][:title]).to be_a String
      expect(parsed_response[:data].first[:attributes]).to have_key(:url)
      expect(parsed_response[:data].first[:attributes][:url]).to be_a String
      expect(parsed_response[:data].first[:attributes]).to have_key(:country)
      expect(parsed_response[:data].first[:attributes][:country]).to be_a String
      expect(parsed_response[:data].first[:attributes]).to have_key(:image)
      expect(parsed_response[:data].first[:attributes][:image]).to be_a String
    end

    it 'returns recipes from a random country if none is chosen' do
      get '/api/v1/recipes'

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_an Array
      expect(parsed_response[:data].count).to be > 0
      expect(parsed_response[:data].first).to be_a Hash
      expect(parsed_response[:data].first).to have_key(:id)
      expect(parsed_response[:data].first[:id]).to eq(nil)
      expect(parsed_response[:data].first).to have_key(:type)
      expect(parsed_response[:data].first[:type]).to eq('recipe')
      expect(parsed_response[:data].first).to have_key(:attributes)
      expect(parsed_response[:data].first[:attributes]).to be_a Hash
      expect(parsed_response[:data].first[:attributes]).to have_key(:title)
      expect(parsed_response[:data].first[:attributes][:title]).to be_a String
      expect(parsed_response[:data].first[:attributes]).to have_key(:url)
      expect(parsed_response[:data].first[:attributes][:url]).to be_a String
      expect(parsed_response[:data].first[:attributes]).to have_key(:country)
      expect(parsed_response[:data].first[:attributes][:country]).to be_a String
      expect(parsed_response[:data].first[:attributes]).to have_key(:image)
      expect(parsed_response[:data].first[:attributes][:image]).to be_a String
    end

    it 'returns an empty array if country parameter is an empty string' do
      country = ''
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({ "data": [] })
      expect(parsed_response[:data].count).to eq(0)
    end

    it 'returns an empty array if value does not return any recipe' do
      country = 'Gondor'
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({ "data": [] })
      expect(parsed_response[:data].count).to eq(0)
    end
  end
end
