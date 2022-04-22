class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu
  validates :quantity, presence: true
end
