require 'rails_helper'

RSpec.describe 'Post Favorites' do
  describe 'add recipes to a list from a JSON request' do
    let!(:api_key1) { 'jgn983hy48thw9begh98h4539h4' }
    let!(:api_key2) { 'jgn983hy48thw9begh98h4539h5' }
    let!(:user1) { create(:user, api_key: api_key1) }
    let!(:user2) { create(:user, api_key: api_key2) }
    let!(:favorite1) { create(:favorite, user_id: user1.id, created_at: '2023-01-18 13:39:13 UTC') }
    let!(:favorite2) { create(:favorite, user_id: user1.id, created_at: '2023-01-18 13:39:14 UTC') }
    let!(:invalid_api_key) { Faker::Internet.password }

    it 'return a users existing favorites recipes' do
      get "/api/v1/favorites?api_key=#{api_key1}"

      expect(response).to be_successful
      expect(response.status).to eq 200

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({
                                      "data": [
                                        {
                                          "id": "#{favorite1.id}",
                                          "type": 'favorite',
                                          "attributes": {
                                            "recipe_title": "#{favorite1.recipe_title}",
                                            "recipe_link": "#{favorite1.recipe_link}",
                                            "country": "#{favorite1.country}",
                                            "created_at": '2023-01-18T13:39:13.000Z'
                                          }
                                        },
                                        {
                                          "id": "#{favorite2.id}",
                                          "type": 'favorite',
                                          "attributes": {
                                            "recipe_title": "#{favorite2.recipe_title}",
                                            "recipe_link": "#{favorite2.recipe_link}",
                                            "country": "#{favorite2.country}",
                                            "created_at": '2023-01-18T13:39:14.000Z'
                                          }
                                        }
                                      ]
                                    })
    end

    it 'will return a relevant error message if api key is invalid' do
      get "/api/v1/favorites?api_key=#{invalid_api_key}"

      expect(response).to_not be_successful
      expect(response.status).to eq 400

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:message]).to eq('API key not valid')
    end

    it 'will return an empty array if user has no favorites' do
      get "/api/v1/favorites?api_key=#{api_key2}"

      expect(response).to be_successful
      expect(response.status).to eq 200

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({ data: [] })
    end
  end
end
