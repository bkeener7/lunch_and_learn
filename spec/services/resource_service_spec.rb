require 'rails_helper'

RSpec.describe ResourceService do
  let!(:country) { 'Morocco' }

  it 'returns a list of videos related to the country selected by user', :vcr do
    response = ResourceService.get_videos(country)

    expect(response).to be_a Hash
    expect(response[:items]).to be_an Array
    expect(response[:items].first).to be_a Hash
    expect(response[:items].first[:id]).to be_a Hash
    # Video ID
    expect(response[:items].first[:id][:videoId]).to be_a String
    expect(response[:items].first[:snippet]).to be_a Hash
    # Video Title
    expect(response[:items].first[:snippet][:title]).to be_a String
    # Alternative Description
    expect(response[:items].first[:snippet][:description]).to be_a String
    expect(response[:items].first[:snippet][:thumbnails]).to be_a Hash
    expect(response[:items].first[:snippet][:thumbnails][:high]).to be_a Hash
    # Image URL
    expect(response[:items].first[:snippet][:thumbnails][:high][:url]).to be_a String
  end
end
