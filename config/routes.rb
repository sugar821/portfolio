Rails.application.routes.draw do
  namespace :admin do
    get "tasks/console","tasks#console"
    resources :tasks
    resources :users
  end
  
  get "tasks/search" , "tasks#search"
  get "tasks/summary" , "tasks#summary"
  
  devise_for :users
  resources :tasks
  resources :users
  root "tasks#top"
end
