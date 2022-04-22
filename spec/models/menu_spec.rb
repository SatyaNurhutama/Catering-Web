require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with with name and description' do
    category = FactoryBot.create(:category, name: "Food")
    expect(FactoryBot.build(:menu, category_ids: [1])).to be_valid
  end

  it 'is invalid without category' do
    menu = FactoryBot.build(:menu_category, category_id: nil)
    menu.valid?
    expect(menu.errors[:category]).to include("must exist")
  end

  it 'is invalid without a name' do
    menu = FactoryBot.build(:menu, name: nil)
    menu.valid?
    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    menu = FactoryBot.build(:menu, price: nil)

    menu.valid?

    expect(menu.errors[:price]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    category = FactoryBot.create(:category, name: "Food")
    menu1 = FactoryBot.create(:menu, name: 'Nasi Uduk', category_ids: [1] )
    menu2 = FactoryBot.build(:menu, name: 'Nasi Uduk', category_ids: [1])

    menu2.valid?
    
    expect(menu2.errors[:name]).to include("has already been taken")
  end

  it "is invalid if price smaller than 0.01" do
    menu = FactoryBot.build(:menu, price: 0.005)

    menu.valid?
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid if description greather than 150 characters" do
    menu = FactoryBot.build(:menu, description: "a" * 151)

    menu.valid?
    expect(menu.errors[:description]).to include("150 characters is the maximum allowed")
  end
  
end