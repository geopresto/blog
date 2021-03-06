Rails.application.routes.draw do

  root 'pages#home'
  resources :users, only: [:new, :create]
  
  resources :articles do
   resources :comments
  end

  resources :photos do
    resources :comments
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'show', to: 'sessions#show'
  delete "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
