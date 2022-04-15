class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :total
      t.string :status
      t.time :order_time

      t.timestamps
    end
  end
end
