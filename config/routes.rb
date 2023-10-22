Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者側機能
  namespace :admin do
    root 'homes#top'
    resources :users, only: [:index, :show, :destroy]
    resources :tweets, only: [:index, :show, :destroy]
    resources :tweet_comments, only: [:index, :show, :destroy]
  end

  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  #ユーザー側 新規登録・ログイン・ログアウト
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    passwords: 'user/passwords',
    registrations: 'user/registrations'
  }
  
  #ユーザー側機能
  scope module: 'user' do
    root 'homes#top'
    get "home/about"=>"homes#about"
    resources :tweets, only: [:new, :index, :show, :edit,:create, :update, :destroy] do
      resources :tweet_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
  	    get "followings" => "relationships#followings", as: "followings"
  	    get "followers" => "relationships#followers", as: "followers"
  	    member do
  	      get :favorites
  	    end
    end
    get "/search", to: "searches#search"
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
