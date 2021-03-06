Rails.application.routes.draw do
  get 'transactions/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :cooperatives do
    resources :cooperations, only: [:new, :create, :show]
    resources :assemblies do
      resources :proposals
    end
  end

  namespace :api do
    scope '/cooperations/:cooperation_id' do
      resources :transactions, only: :create
    end
  end

  root 'cooperatives#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
