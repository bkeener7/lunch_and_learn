class Resource
  attr_reader :country, :video, :images

  def initialize(video, country)
    @country = country
    @video = {
      title: video[:snippet][:title],
      youtube_video_id: video[:id][:videoId]
    }
    @images = [{
      alt_tag: video[:snippet][:description],
      url: video[:snippet][:thumbnails][:high][:url]
    }]
  end
end
