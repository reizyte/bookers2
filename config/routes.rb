Rails.application.routes.draw do
   get "homes/about" => "homes#about",as:'about'
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:edit, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
