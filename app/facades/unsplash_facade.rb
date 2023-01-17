class UnsplashFacade
  def self.photos(country)
    UnsplashService.get_photos(country)[:results][0..9].map do |photo|
      Unsplash.new(photo)
    end
  end
end
