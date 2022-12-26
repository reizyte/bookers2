Rails.application.routes.draw do
   get "home/about" => "homes#about",as:'about'
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :edit, :create, :destroy, :update]
  resources :users, only: [:edit, :show, :index, :update] do
    resource :relationships, only:[:create, :destroy]
    get :followeds, on: :member
    get :followers, on: :member
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
