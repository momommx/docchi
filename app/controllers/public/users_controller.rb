class Public::UsersController < ApplicationController
  #非ログイン時でも詳細ページは閲覧可能
  skip_before_action :login_required, only: [:show]
    
  def show
  end 
 
end
