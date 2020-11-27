Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :goals, only: [:index, :create, :new, :edit, :update, :destroy]

  get "/profile", to: "profiles#profile"
  patch "/profile", to: "profiles#update"
  get "/profile/edit", to: "profiles#edit"
  get "/dashboard" , to: "dashboard#show"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
