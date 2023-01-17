class UnsplashService
  def self.get_photos(country)
    get_url("/search/photos?query=#{country}")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_access_key']
    end
  end
end
