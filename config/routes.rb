Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  root to: "items#index"
  resources :items, except: [:index] do
    resources :purchases
  end
end