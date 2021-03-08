Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  root 'homes#top'
  get 'search' => 'searches#search'
  get 'home/about' => 'homes#about'

  resources :users, only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :rooms, only: [:create, :show]
  resources :chats, only: [:create]
end