Rails.application.routes.draw do
  resources :assistants, only: [:update]
  resources :days
  resources :weeks
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :admin, only: [:index]
  resources :users, only: [:index, :show] do
    post :switch_authorization, on: :member
  end

  root to: "home#index"
end
