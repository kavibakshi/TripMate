Rails.application.routes.draw do
  devise_for :accounts
  #get 'home/index'
  get 'home/map'

  get "sign_up", to: "registrations#new"


<<<<<<< Updated upstream
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
=======
  get '/admin/dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'


  delete "logout", to: "sessions#destroy"

  root to: "home#index"
>>>>>>> Stashed changes

  # Defines the root path route ("/")
  # root "articles#index"
end
