Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'
  get "offers", to: "offers#index", as: :offer
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
