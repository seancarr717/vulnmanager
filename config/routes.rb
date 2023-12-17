Rails.application.routes.draw do
  devise_for :users
  resources :vulns
  
  get "home/features"
  root "home#index"
end
