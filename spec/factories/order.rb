FactoryBot.define do
  factory :order do
    total { 10000.0 }
    status { "CANCELED" }
    customer
  end

  factory :invalid_order, parent: :order do
    total { "SATya" }
    status { "NEW" }
  end

  factory :customer do
    name { "satya" }
    email {  "satya@gmail.com" }
  end

  factory :invalid_customer, parent: :customer do
    name { "satyanu" }
    email { "satya@wkkwkw" }
  end

  factory :order_detail do
    menu
    order
    quantity { 1 }
  end

end