Rails.application.routes.draw do
  resources :categories, only: [:index, :new, :create]
end
