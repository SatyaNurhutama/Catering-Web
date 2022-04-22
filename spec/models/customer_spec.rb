require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with a email" do
    customer = Customer.new(
      name: "Satya",
      email: "satya@gmail.com"
    )
    expect(customer).to be_valid
  end

  it "is invalid with wrong email" do
    customer = Customer.new(
      name: "Satya",
      email: "satya@wkwkwk"
    )

    customer.valid?

    expect(customer.errors[:email]).to include("is invalid")
  end
end