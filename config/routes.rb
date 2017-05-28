Rails.application.routes.draw do
  resources :categories, except: [:edit, :update, :destroy]
  resources :stories, except: [:edit, :update, :destroy]
end
