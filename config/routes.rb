Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'orders#index'

  resources :orders, only: [:index, :update]
end
