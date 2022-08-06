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
    resources :users,   only: [:index, :update]
  end
  

  # ユーザ用
  # [URL] /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'  
  
  scope :public do   # scopeメソッドを用いて、Prefixのpublicのみを消す。
    resources :topics, only: [:index, :show, :new] do
      resource  :favorites, only: [:create, :destroy]
      resources :answers,   only: [:create, :destroy]
    end
    resources :users, only: [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
