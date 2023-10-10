# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "about-page", to:"about#index", as: :about

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get '/admin/dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'

  get '/admin/view_all_users', to: 'admin_dashboard#view_all_users', as: 'view_all_users'


  delete "logout", to: "sessions#destroy"

  root to: "home#index"

end
