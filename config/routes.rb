Rails.application.routes.draw do
  resources :posts
  resources :oppourtunities
  devise_for :accounts

  get "/blog" => "posts#latest", as: :blog
  
  get "/dashboard" =>'dashboard#index', as: :dashboard
  get "/accounts" =>'admin#accounts', as: :accounts
  get "/profile/:id" =>'dashboard#profile', as: :profile
  post "/user/message" => "oppourtunities#email_user", as: :email_user

  root to: 'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
