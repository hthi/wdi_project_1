Rails.application.routes.draw do
  resources :patients, only: [:index, :new, :show]
end
