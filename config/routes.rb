Rails.application.routes.draw do
  resources :posts do
    get :search, on: :collection
  end
  devise_for :users
  root to: 'home#top'
  get "home/inquire"
  resources :users, :only => [:show]
end
