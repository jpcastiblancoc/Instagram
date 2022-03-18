Rails.application.routes.draw do
  get '/post' => 'post#index'

  get '/post/new_p' => 'post#new'
  post '/posts' => 'post#create'

  get 'post/index'
  get 'post/create'
  get 'post/new_p'
  post 'profile/:id/edit', to: 'profile#update'


  get '/profile/new' => 'profile#new'


  get '/user' => 'user#index'
  get '/user/new' => 'user#new'
  post '/users' => 'user#create'

  root to: "post#index"


  resources :profile

  devise_for :users
  # root to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home

  resources :post
end
