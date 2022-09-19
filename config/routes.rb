Rails.application.routes.draw do
  root to: "items#index"
  get 'items/index'
  resources :items, only: :index
end
