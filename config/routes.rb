Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get "home/inquire"
  resources :users, :only => [:show]
end
