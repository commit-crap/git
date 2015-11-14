Rails.application.routes.draw do
  resources :roles
  devise_for :users
  resources :users, path: 'teste'

  namespace :admin, shallow: true  do
    resources :branch
  end

  root 'sites#index'
end
