Rails.application.routes.draw do

  get 'post/index'
  get 'post/create'
  get 'post/new'
  get 'profile/index'
  get 'profile/new'
  post 'profile/create'

  root to: "post#index"




  devise_for :users
  # root to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  resources :profile
end
