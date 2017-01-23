Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'company_searches#new'

  resource :company_search, only: [:new, :create, :show]

  resources :remote_companies, only: [:show]

  resources :companies, only: [:create, :index, :show]
end
