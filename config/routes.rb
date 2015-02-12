Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  #search bar
  resources :keywords do
  collection do
    get 'search'
  end
end

  resources :patients do
    resources :appointments
  end

  resources :appointments, only: [] do
    resources :details, only: [:new, :create, :destroy]
  end
end
