Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'

  resources :offers, only:[:new, :create, :show, :index, :edit, :update, :destroy]
  get 'dashboard', to: 'offers#dashboard', as: :dashboard
end
