FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { 10000.0}
  end

  factory :category do
    name { "Food" }
  end

  factory :menu_category do
    category
    menu
  end
end