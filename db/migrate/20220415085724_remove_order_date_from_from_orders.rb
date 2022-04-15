class RemoveOrderDateFromFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :order_date, :time
  end
end
