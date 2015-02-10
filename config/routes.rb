Rails.application.routes.draw do

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
