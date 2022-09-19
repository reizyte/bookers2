Rails.application.routes.draw do
   get "homes/about" => "homes#about",as:'about'
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :edit, :create, :destroy, :update]
  resources :users, only: [:edit, :show, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
