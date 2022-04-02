Rails.application.routes.draw do
  post '/posts' => 'post#create'
  resources :post, except: [:create, :update, :edit]
  root to: "post#index"
  resources :profile, except: [:index]
  devise_for :users
end
