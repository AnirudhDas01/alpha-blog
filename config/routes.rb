Rails.application.routes.draw do
  root to: 'home#index'
  get "about", to:'about#index', as: :about
  resources :articles
  get 'signup',to: 'users#new', as: :signup
  resources :users, expect: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]

end
