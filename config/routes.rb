Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars do 
    resources :rentals, only: [ :new, :create ]
  end
  resources :rentals, only: [:update, :edit, :destroy, :show, :index]
end
