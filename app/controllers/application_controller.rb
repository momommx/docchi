class ApplicationController < ActionController::Base
    
  #非ログイン時でも全ページ閲覧可能にする
  before_action :login_required
 
  private
  
  #全てのアクションの処理前にユーザーがログイン済みかどうか確認する
  def login_required 
   redirect_to new_user_session_path unless current_user
  end
  
end
