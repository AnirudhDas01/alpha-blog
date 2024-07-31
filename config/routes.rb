Rails.application.routes.draw do
  root to: 'home#index'
  get "about", to:'about#index', as: :about
  resources :articles, only: [:show , :index, :new, :create, :edit, :update]
end
