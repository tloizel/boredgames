Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root to: 'pages#home'

  resources :offers, only:[:new, :create, :show, :index, :edit, :update, :destroy] do
    resources :transactions, only:[:create]
  end
  get 'dashboard', to: 'offers#dashboard', as: :dashboard
end
