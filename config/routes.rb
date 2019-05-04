Rails.application.routes.draw do
  resources :genres
  resources :comics

  get 'comics/index'

  root 'comics#index'
end
