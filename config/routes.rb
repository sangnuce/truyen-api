Rails.application.routes.draw do
  root "categories#index"
  resources :categories, except: [:edit, :update, :destroy]
  resources :stories, except: [:edit, :update, :destroy]
end
