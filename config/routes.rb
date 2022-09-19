Rails.application.routes.draw do
  get 'items', to: 'items#index'
  root to: "items#index"

  resources :items, only: :index
end
