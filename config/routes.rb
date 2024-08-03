Rails.application.routes.draw do
  root to: 'home#index'
  get "about", to:'about#index', as: :about
  resources :articles
  get 'signup',to: 'users#new', as: :signup
  resources :users, expect: [:new]
end
