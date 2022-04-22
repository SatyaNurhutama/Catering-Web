require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is valid with a customer and total' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is valid with a customer orders more than one order' do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.build(:order, customer_id: 1)
    order2 = FactoryBot.build(:order, customer_id: 1)
    expect(order2).to be_valid
  end

  it 'is valid with a customer orders more than one menu' do
    category = FactoryBot.create(:category, name: "Food")
    menu = FactoryBot.build(:menu, category_ids: [1])
    
    order = FactoryBot.build(:order)
    
    order_detail1 = FactoryBot.create(:order_detail, order: order, menu: menu)
    order_detail2 = FactoryBot.create(:order_detail, order: order, menu: menu)
    
    expect(order_detail2).to be_valid
  end

  it 'is invalid with a total not numeric' do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.build(:order, customer_id: 1, total: "asas")

    order.valid?
    
    expect(order.errors[:total]).to include("is not a number")
  end
end