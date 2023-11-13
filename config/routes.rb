# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :itineraries
  resources :lists
  resources :notes
  resources :markers, only: [:index, :create, :destroy]

  get "map", to: "map#index"
  get "about", to:"about#index", as: :about
  get "lists", to:"lists#index"
  get "notes", to: "notes#index"


  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get '/admin/dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'

  get '/admin/view_all_users', to: 'admin_dashboard#view_all_users', as: 'view_all_users'


  delete "logout", to: "sessions#destroy"

  root to: "home#index"

end
