FactoryBot.define do
  factory :menu do
    name { "Nasi Uduk" }
    description { "Betawi style steamed rice cooked in coconut milk. Delicious!" }
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