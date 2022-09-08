Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Authentication
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  #Dogs Routes
  get "/dogs" => "dogs#index"
  get "/dogs/:id" => "dogs#show"
  post "/dogs" => "dogs#create"
  patch "/dogs/:id" => "dogs#update"
  delete "/dogs/:id" => "dogs#destroy"
end
