Rails.application.routes.draw do
  get "tasks/test_index","tasks#test_index"
  get "tasks/search" , "tasks#search"
  devise_for :users
  resources :tasks
  resources :users
  root "tasks#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
