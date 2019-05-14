Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :genres
  resources :comics

  get 'comics/index'

  root 'comics#index'
end
