Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
    #get 'relationships'
    resources :users,only: [:show,:edit,:update,:destroy] do
      get 'followers' => 'relationships#followers', as: 'followers'
      get 'followings' => 'relationships#followings', as: 'followings'
      resource :relationships, only: [:create, :destroy]
    end
    resources :tweets do
      resources :comments, only: [:new, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :notifications, only: :index
 end
