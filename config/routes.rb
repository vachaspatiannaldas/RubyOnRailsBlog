Rails.application.routes.draw do
  devise_for :users
  resources :categories
  # get 'blogs/index'
  # get 'blogs/show'
  # get 'blogs/new'
  # get 'blogs/edit'

  resources :blogs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "blogs#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
