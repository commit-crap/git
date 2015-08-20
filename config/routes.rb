Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
  end

  scope module: :site do
  end
end
