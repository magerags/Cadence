Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :goals, only: [:index, :create, :new, :edit, :update, :destroy]
  resources :user_categories, only: [:index, :create, :new, :edit, :update, :destroy]

  get 'setup/name', to: 'setups#step1_name'
  get 'setup/hours', to: 'setups#step2_hours'
  post 'setup/hours', to: 'setups#create_step2'
  get 'setup/goals', to: 'setups#step3_goals'
  post 'setup/goals', to: 'setups#create_step3'

  get "/profile", to: "profiles#profile"
  patch "/profile", to: "profiles#update"
  get "/profile/edit", to: "profiles#edit"
  get "/dashboard" , to: "dashboard#show"

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
