Rails.application.routes.draw do
  root 'welcome#index'

  resources :repositories
  resources :roles
  devise_for :users
  resources :users, path: 'customusers', shallow: true do
    get 'search', to: 'users#search', as: 'search', on: :collection
  end

  namespace :admin, shallow: true  do
    resources :branch
  end
end
