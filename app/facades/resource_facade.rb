class ResourceFacade
  def self.videos(country)
    images = UnsplashFacade.photos(country)
    ResourceService.get_videos(country)[:items].map do |video|
      Resource.new(video, images, country)
    end
  end
end
