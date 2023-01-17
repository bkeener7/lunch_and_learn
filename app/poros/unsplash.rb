class Unsplash
  attr_reader :alt_tag, :url

  def initialize(photo)
    @alt_tag = photo[:alt_description]
    @url = photo[:urls][:full]
  end
end
