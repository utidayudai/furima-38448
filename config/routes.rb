Rails.application.routes.draw do
  devise_for :users
  root to: "sells#index"
  get 'sells/index'
  resources :user, only: [:edit, :update]
  resources :sells, only: [:index, :new, :create, :show]
end
