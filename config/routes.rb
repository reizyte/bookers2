Rails.application.routes.draw do
  
  
  root to: 'homes#top'
  devise_for :users
  resources :bookers, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:edit, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
