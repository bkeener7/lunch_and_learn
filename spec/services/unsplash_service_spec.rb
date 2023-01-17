require 'rails_helper'

RSpec.describe UnsplashService do
  let!(:country) { 'Romania' }

  it 'returns photos from a country', :vcr do
    response = UnsplashService.get_photos(country)

    expect(response).to be_a Hash
    expect(response.keys).to eq([:total, :total_pages, :results])
    expect(response[:results]).to be_an Array
    expect(response[:results].count).to be > 0
    expect(response[:results].first).to be_a Hash
    expect(response[:results].first.keys).to eq([:id,
                                                 :created_at,
                                                 :updated_at,
                                                 :promoted_at,
                                                 :width,
                                                 :height,
                                                 :color,
                                                 :blur_hash,
                                                 :description,
                                                 :alt_description,
                                                 :urls,
                                                 :links,
                                                 :likes,
                                                 :liked_by_user,
                                                 :current_user_collections,
                                                 :sponsorship,
                                                 :topic_submissions,
                                                 :user,
                                                 :tags])
    expect(response[:results].first[:alt_description]).to be_a String
    expect(response[:results].first[:urls]).to be_a Hash
    expect(response[:results].first[:urls][:full]).to be_a String
  end
end
