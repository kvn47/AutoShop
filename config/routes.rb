Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :orders, only: %i[new create show update]

  namespace :admin do
    root 'pages#index'
    resources :components, except: :show
    resources :orders, only: %i[index show update destroy]
  end
end
