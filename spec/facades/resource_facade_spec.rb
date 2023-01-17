require 'rails_helper'

RSpec.describe ResourceFacade do
  describe 'Resource', :vcr do
    let!(:country) { 'South Korea' }
    let!(:resources) { ResourceFacade.videos(country) }

    it 'exists' do
      expect(ResourceFacade.new).to be_an_instance_of(ResourceFacade)
    end

    it 'returns video resources from the chosen country' do
      expect(resources).to be_an Array
      expect(resources.first.country).to be_a String
      expect(resources.first.country).to eq('South Korea')
      expect(resources.first.video).to be_a Hash
      expect(resources.first.video.keys).to eq([:title, :youtube_video_id])
      expect(resources.first.images).to be_an Array
      expect(resources.first.images.first.keys).to eq([:alt_tag, :url])
    end
  end
end
