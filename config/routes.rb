Rails.application.routes.draw do
  devise_for :users
  resources :genres
  resources :comics

  get 'comics/index'

  root 'comics#index'
end
