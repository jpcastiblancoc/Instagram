Rails.application.routes.draw do
  root to: "post#index"
  post '/posts' => 'post#create'
  resources :post, except: [:create, :update, :edit]
  resources :profile, except: [:index]
  devise_for :users
end
