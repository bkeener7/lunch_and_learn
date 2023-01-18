class Favorite < ApplicationRecord
  belongs_to :user

  validates :country, :recipe_link, :recipe_title, presence: { presence: true }
end
