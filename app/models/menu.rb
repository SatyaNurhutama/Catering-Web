class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validates :description, length:{ maximum: 150, too_long: "%{count} characters is the maximum allowed"}
  has_many :menu_categories
  has_many :categories, through: :menu_categories
end
