class CountryService
  def self.get_countries
    get_url('/v3.1/all')
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://restcountries.com')
  end
end
