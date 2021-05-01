Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'

  resources :offers, only:[:new, :create, :show, :index, :edit, :update, :destroy] do
    resources :transactions, only:[:create]
  end
  get 'dashboard', to: 'offers#dashboard', as: :dashboard

end
