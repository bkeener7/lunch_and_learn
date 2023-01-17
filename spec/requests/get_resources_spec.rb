require 'rails_helper'

RSpec.describe 'Get Resources Info' do
  describe 'Learning resources API request', :vcr do
    it 'returns learning resources from the country chosen by the user' do
      country = 'Romania'
      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_an Array
      expect(parsed_response[:data].count).to be > 0
      expect(parsed_response[:data].first).to be_a Hash
      expect(parsed_response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(parsed_response[:data].first[:id]).to eq(nil)
      expect(parsed_response[:data].first[:type]).to eq('learning_resource')
      expect(parsed_response[:data].first[:attributes]).to be_a Hash
      expect(parsed_response[:data].first[:attributes].keys).to eq([:country, :video, :images])
      expect(parsed_response[:data].first[:attributes][:country]).to be_a String
      expect(parsed_response[:data].first[:attributes][:country]).to eq('Romania')
      expect(parsed_response[:data].first[:attributes][:video]).to be_a Hash
      expect(parsed_response[:data].first[:attributes][:video].keys).to eq([:title, :youtube_video_id])
      expect(parsed_response[:data].first[:attributes][:video][:title]).to be_a String
      expect(parsed_response[:data].first[:attributes][:video][:youtube_video_id]).to be_a String
      expect(parsed_response[:data].first[:attributes][:images]).to be_an Array
      expect(parsed_response[:data].first[:attributes][:images].first).to be_a Hash
      expect(parsed_response[:data].first[:attributes][:images].first.keys).to eq([:alt_tag, :url])
      expect(parsed_response[:data].first[:attributes][:images].first[:alt_tag]).to be_a String
      expect(parsed_response[:data].first[:attributes][:images].first[:url]).to be_a String
    end

    it 'returns an empty object if no videos are found' do
      country = 'NoCountryInput'
      get "/api/v1/learning_resources?country=#{country}"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to eq({
                                      "data": {
                                        "id": nil,
                                        "type": 'learning_resource',
                                        "attributes": {
                                          "country": 'NoCountryInput',
                                          "video": {},
                                          "images": []
                                        }
                                      }
                                    })
    end
  end
end
