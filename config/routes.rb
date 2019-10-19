Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :cooperatives do
    resources :cooperations, only: [:new, :create]
  end
  root 'cooperatives#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
