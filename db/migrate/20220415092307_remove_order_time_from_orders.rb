class RemoveOrderTimeFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :order_time, :time
  end
end
