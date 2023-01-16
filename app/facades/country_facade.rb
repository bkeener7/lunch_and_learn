class CountryFacade
  def self.random_country
    CountryFacade.countries.sample.name
  end

  def self.countries
    CountryService.get_countries.map do |country|
      Country.new(country)
    end
  end
end
