FactoryBot.define do
  factory :favorite do
    country { Faker::Address.country }
    recipe_link { Faker::Address.country }
    recipe_title { Faker::Address.country }
    association :user, factory: :user
  end
end
