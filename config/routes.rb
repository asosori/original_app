Rails.application.routes.draw do
  post "likes/:post_id" => "likes#create"
  delete "likes/:post_id" => "likes#destroy"

  resources :posts do
    get :search, on: :collection
  end

  devise_for :users
  resources :users, :only => [:show] do
    get :likes, on: :member
  end
  
  root to: 'home#top'
  get "home/inquire"
  post 'home/inquire' => "inquiries#confirm"
  post 'inquiries/thanks' 
end
