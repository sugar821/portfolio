Rails.application.routes.draw do
  resources :reviews
  namespace :admin do
    get "tasks/console","tasks#console"
    resources :tasks
    resources :users
  end
  
  get "tasks/search" , "tasks#search"
  get "tasks/summary" , "tasks#summary"
  
  devise_for :users 
  resources :tasks do
    resources :reviews
    member do
      delete "delete_image"
    end
  end
  resources :users do
    member do
      delete "delete_avatar"
    end
  end
  
  root "tasks#top"
end