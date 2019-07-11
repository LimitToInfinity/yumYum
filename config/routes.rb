Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/analytics", to: "analytics#index"
  
  resources :pizzas
  resources :users, only: [:create]
  
  get "/", to: redirect("/pizzas")
  
  get "signup", to: "users#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
end
