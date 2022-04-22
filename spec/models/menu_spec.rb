require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name and a description' do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    expect(menu).to be_valid
  end

  it 'is invalid without a name' do
    menu = Menu.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: nil
    )

    menu.valid?

    expect(menu.errors[:price]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    menu1 = Menu.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 10000.0
    )
    
    menu2 = Menu.new(
      name: "Nasi Uduk",
      description: "Just with a different description.",
      price: 10000.0
    )

    menu2.valid?
    
    expect(menu2.errors[:name]).to include("has already been taken")
  end

  it "is invalid if price smaller than 0.01" do
    menu = Menu.new(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 0.005
    )

    menu.valid?
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid if description greather than 150 characters" do
    menu = Menu.new(
      name: "Nasi Uduk",
      description: "a" * 151,
      price: 10000.0
    )

    menu.valid?
    expect(menu.errors[:description]).to include("150 characters is the maximum allowed")
  end
  
end