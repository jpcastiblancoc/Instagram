Rails.application.routes.draw do
  get '/post' => 'post#index'

  get '/post/new' => 'post#new'
  post '/posts' => 'post#create'

  get 'post/index'
  get 'post/create'
  get 'post/new'
  post 'profile/:id/edit', to: 'profile#update'


  root to: "post#index"


  resources :profile

  devise_for :users
  # root to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home

  resources :post
end
