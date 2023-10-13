Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  

  #ユーザー側 新規登録・ログイン・ログアウト
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    passwords: 'user/passwords',
    registrations: 'user/registrations'
  }

  #ユーザー側機能
  scope module: 'user' do
    root 'homes#top'
    resources :tweets, only: [:new, :index, :show, :edit,:create, :update, :destroy] do
      resources :tweet_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
