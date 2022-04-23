class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :menu_categories, dependent: :delete_all
  has_many :menus, through: :menu_categories
end
