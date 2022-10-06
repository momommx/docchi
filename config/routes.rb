Rails.application.routes.draw do
  
  # 管理者用
  # [URL] /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  
  get "admin" => "admin/answers#index"
  namespace :admin do
    resources :answers, only: [:index, :destroy]
    resources :genres,  only: [:index, :create, :destroy]
    resources :users,   only: [:index, :update, :edit]
  end
  

  # ユーザ用
  # [URL] /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'  
  
  namespace :public do   
    resources :topics, only: [:index, :show, :new, :create, :destroy] do
      resource  :favorites, only: [:create, :destroy]
      resources :answers,   only: [:create, :destroy]
    end
    
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites   #いいねした投稿一覧表示のための
      end
    end
    
  end
  

  
  # ゲストユーザ用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end  
  
  # 検索機能
  get "search" => "searches#search"
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
