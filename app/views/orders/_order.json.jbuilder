json.extract! order, :id, :customer_id, :total, :status, :order_time, :created_at, :updated_at
json.url order_url(order, format: :json)
