Rails.application.routes.draw do
  post "likes/:post_id" => "likes#create"
  delete "likes/:post_id" => "likes#destroy"
  resources :posts do
    get :search, on: :collection
  end
  devise_for :users
  root to: 'home#top'
  get "home/inquire"
  resources :users, :only => [:show]
end
