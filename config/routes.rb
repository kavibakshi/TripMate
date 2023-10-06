Rails.application.routes.draw do
  devise_for :accounts
  #get 'home/index'
  get 'home/map'

  get "sign_up", to: "registrations#new"


  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
