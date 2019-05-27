Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  resources :genres
  resources :profile
  resources :comics do
    resources :stories
  end

  get 'comics/index'

  root 'comics#index'
end
