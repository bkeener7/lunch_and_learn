class Resource
  attr_reader :country, :video, :images

  def initialize(video, images, country)
    @country = country
    @video = {
      title: video[:snippet][:title],
      youtube_video_id: video[:id][:videoId]
    }
    @images = images.map do |image|
      {
        alt_tag: image.alt_tag,
        url: image.url
      }
    end
  end
end
