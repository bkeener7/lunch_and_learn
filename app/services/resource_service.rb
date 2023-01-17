class ResourceService
  def self.get_videos(country)
    get_url("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://youtube.googleapis.com') do |f|
      f.params['key'] = ENV['google_API_KEY']
    end
  end
end
