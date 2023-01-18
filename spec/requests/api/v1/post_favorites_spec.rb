require 'rails_helper'

RSpec.describe 'Post Favorites' do
  describe 'add recipes to a list from a JSON request' do
    it 'can accept a JSON request and return a confirmation' do
      user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
      favorites_info = {
        api_key: 'jgn983hy48thw9begh98h4539h4',
        country: 'thailand',
        recipe_link: 'https://www.seriouseats.com/thai-style-fried-rice-crab-recipe',
        recipe_title: 'Thai-Style Crab Fried Rice Recipe'
      }

      headers = { 'Content-Type': 'application/json' }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorites_info)

      expect(response).to be_successful
      expect(response.status).to eq 201

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({ "success": "Favorite added successfully" })
    end

    xit 'will return a relevant error message if email address is already in use' do
      user1 = create(:user, email: 'bill@yahoo.com')
      new_user_info = {
        name: Faker::Name.name,
        email: 'bill@yahoo.com'
      }
      headers = { 'Content-Type': 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(new_user_info)

      expect(response).not_to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 400
      expect(parsed_response[:message]).to eq('Email has already been taken')
    end
  end
end
