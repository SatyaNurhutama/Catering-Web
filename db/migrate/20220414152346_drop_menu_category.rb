class DropMenuCategory < ActiveRecord::Migration[7.0]
  def change
    drop_table :menu_categories
  end
end
