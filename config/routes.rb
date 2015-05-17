Rails.application.routes.draw do

  namespace :api, defaults: { format: "json" } do
    resources :orders, only: [:index, :show]
    resources :users, only: [:index, :show]
  end
  

  root 'users#new'


  #users
  get "signup" => "users#new"
  resources :users, only: [:create, :new]

  # sessions
  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #addresses
  resources :addresses
  get '/addresses/:id/edit' => 'addresses#update'

  #orders
  resources :orders
  get '/new' => 'orders#new', as: :new_order_path


  
end
