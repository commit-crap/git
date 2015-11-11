Rails.application.routes.draw do
  devise_for :users
  resources :users

  namespace :admin, shallow: true  do
    resources :branch
  end

  root 'sites#index'
end
