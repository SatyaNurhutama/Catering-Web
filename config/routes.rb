Rails.application.routes.draw do
  resources :categories
  resources :orders
  resources :customers
  resources :menus
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/report", to: "report#index"
  get "/report/date", to: "report#date"
  get "/report/email", to: "report#email"
  get "/report/total", to: "report#total"
end
