class ResourceFacade
  def self.videos(country)
    ResourceService.get_videos(country)[:items].map do |video|
      Resource.new(video, country)
    end
  end
end
