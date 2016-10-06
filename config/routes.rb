Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users

  root 'pages#index'

  namespace :admin do
    resources :components, except: :show
  end
end
