Rails.application.routes.draw do
  resources :patients do
    resources :appointments, only: [:new, :show]
  end
end
