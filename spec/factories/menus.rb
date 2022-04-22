FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { "Betawi style steamed rice cooked in coconut milk. Delicious!" }
    price { 10000.0}
  end

  factory :invalid_menu, parent: :menu do
    name { nil }
    description { nil }
    price { 10000.0 }
  end

  factory :category do
    name { Faker::Food.ethnic_category }
  end

  factory :invalid_category, parent: :category do
    name { nil }
  end

  factory :menu_category do
    category
    menu
  end
end