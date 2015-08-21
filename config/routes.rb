Rails.application.routes.draw do
  devise_for :users

  namespace :admin, shallow: true  do
    resources :branch
  end

  scope module: :site do
  end
end
