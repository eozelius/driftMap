Rails.application.routes.draw do
  root 'home#index'

  resources :users, except: :index

  get 'login',     to: 'sessions#new'
  get 'signup',    to: 'users#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
