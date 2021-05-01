Rails.application.routes.draw do
  devise_for :users
  root to: 'offers#index'

  resources :offers, only:[:new, :create, :show, :index, :edit, :update, :destroy] do
    resources :transactions, only:[:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
