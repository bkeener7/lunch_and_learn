require 'rails_helper'

RSpec.describe 'Post User' do
  describe 'create new user from JSON request' do
    it 'can accept a JSON request and return a properly formatted JSON' do
      user_info = {
        name: 'Athena Dao',
        email: 'athenadao@bestgirlever.com'
      }
      headers = { 'Content-Type': 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(user_info)

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({
                                      "data": {
                                        "type": 'user',
                                        "id": '1',
                                        "attributes": {
                                          "name": 'Athena Dao',
                                          "email": 'athenadao@bestgirlever.com',
                                          "api_key": "#{User.last.api_key}"
                                        }
                                      }
                                    })
    end

    it 'will return a relevant error message if email address is already in use' do
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
