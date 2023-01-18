require 'rails_helper'

RSpec.describe 'Post Favorites' do
  describe 'add recipes to a list from a JSON request' do
    it 'can accept a JSON request and return a confirmation' do
      user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
      favorites_info = {
        api_key: 'jgn983hy48thw9begh98h4539h4',
        country: 'Thailand',
        recipe_link: 'https://www.seriouseats.com/thai-style-fried-rice-crab-recipe',
        recipe_title: 'Thai-Style Crab Fried Rice Recipe'
      }

      headers = { 'Content-Type': 'application/json' }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorites_info)

      expect(response).to be_successful
      expect(response.status).to eq 201

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({ "success": 'Favorite added successfully' })
      expect(user.favorites.first.country).to eq('Thailand')
      expect(user.favorites.first.recipe_link).to eq('https://www.seriouseats.com/thai-style-fried-rice-crab-recipe')
      expect(user.favorites.first.recipe_title).to eq('Thai-Style Crab Fried Rice Recipe')
      expect(user.favorites.first.user_id).to eq("#{user.id}".to_i)
    end

    it 'will return a relevant error message if api key is invalid' do
      user = create(:user)
      favorites_info = {
        api_key: 'jgn983hy48thw9begh98h4539h4',
        country: 'Thailand',
        recipe_link: 'https://www.seriouseats.com/thai-style-fried-rice-crab-recipe',
        recipe_title: 'Thai-Style Crab Fried Rice Recipe'
      }

      headers = { 'Content-Type': 'application/json' }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorites_info)

      expect(response).to_not be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 400
      expect(parsed_response[:message]).to eq('API key not valid')
    end

    it 'will not save if new favorite params are invalid' do
      user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
      favorites_info = {
        api_key: 'jgn983hy48thw9begh98h4539h4',
        recipe_link: 'https://www.seriouseats.com/thai-style-fried-rice-crab-recipe',
        recipe_title: 'Thai-Style Crab Fried Rice Recipe'
      }

      headers = { 'Content-Type': 'application/json' }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorites_info)

      expect(response).to_not be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 400
      expect(parsed_response[:message]).to eq("Country can't be blank")
    end
  end
end
