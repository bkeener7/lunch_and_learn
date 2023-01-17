require 'rails_helper'

RSpec.describe Resource do
  describe 'resources poros', :vcr do
    let!(:country) { 'Morocco' }
    let!(:video_data) do
      { kind: 'youtube#searchResult',
        etag: 'XPYjBfW0Pbyc_zWHhytVP_K67Ok',
        id: { kind: 'youtube#video', videoId: 'dm9HJQNbU0M' },
        snippet: { publishedAt: '2022-04-15T03:34:02Z',
                   channelId: 'UCluQ5yInbeAkkeCndNnUhpw',
                   title: 'A Super Quick History of Morocco',
                   description: 'Audio Requiring Attribution: Arab Instruments: https://commons.wikimedia.org/wiki/File:Playing_Darbuka_on_the_Beach.webm ...',
                   thumbnails: { default: { url: 'https://i.ytimg.com/vi/dm9HJQNbU0M/default.jpg', width: 120, height: 90 },
                                 medium: { url: 'https://i.ytimg.com/vi/dm9HJQNbU0M/mqdefault.jpg', width: 320, height: 180 },
                                 high: { url: 'https://i.ytimg.com/vi/dm9HJQNbU0M/hqdefault.jpg', width: 480, height: 360 } },
                   channelTitle: 'Mr History',
                   liveBroadcastContent: 'none',
                   publishTime: '2022-04-15T03:34:02Z' } }
    end
    let!(:photo_data) { UnsplashFacade.photos(country) }
    let!(:resource) { Resource.new(video_data, photo_data, country) }

    it 'exists and has attributes' do
      expect(resource).to be_an_instance_of(Resource)
      expect(resource.country).to eq('Morocco')
      expect(resource.video).to eq({
                                     title: 'A Super Quick History of Morocco',
                                     youtube_video_id: 'dm9HJQNbU0M'
                                   })
      expect(resource.images.first.keys).to eq([:alt_tag, :url])
    end
  end
end
