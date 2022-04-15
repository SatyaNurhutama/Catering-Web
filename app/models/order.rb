class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :delete_all
  has_many :menus, through: :order_details
  accepts_nested_attributes_for :order_details
end
