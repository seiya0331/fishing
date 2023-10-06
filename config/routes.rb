Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  #ユーザー側 新規登録・ログイン・ログアウト
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  #ユーザー側機能
  scope module: 'user' do
    root 'homes#top'
    resources :tweets, only: [:new, :index, :show, :edit,:create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
