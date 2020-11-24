Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: [:index, :show, :new, :edit, :update, :destroy]

  get "/profile", to: "profiles#profile"
  get "/profile/edit", to: "profiles#edit"
  patch "/profile", to: "profiles#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
