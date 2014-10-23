Rails.application.routes.draw do
  root to: "home#index"

  resources :team_interests, only: [:create]
  resources :customer_interests, only: [:create]
end
