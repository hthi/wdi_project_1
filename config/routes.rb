Rails.application.routes.draw do
  resources :patients do
    resources :appointments
  end

  resources :appointments, only: [] do
    resources :details, only: [:new, :create]
  end
end
