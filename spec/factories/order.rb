FactoryBot.define do
  factory :order do
    total { 10000.0 }
    status { "NEW" }
    customer
  end

  factory :customer do
    name { "satya" }
    email {  "satya@gmail.com" }
  end

  factory :order_detail do
    menu
    order
    quantity { 1 }
  end

end