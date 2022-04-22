json.extract! category, :id, :name, :created_at, :updated_at
json.url customer_url(category, format: :json)