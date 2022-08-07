class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource) 
    public_topics_path
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :user
      root_path
    end
  end


  protected

  #Sign_upの際に、ユーザー名(name)のデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
    
  #非ログイン時でも全ページ閲覧可能にする
  #before_action :login_required
 
  #private
  
  #全てのアクションの処理前にユーザーがログイン済みかどうか確認する
  #def login_required 
   #redirect_to new_user_session_path unless user_signed_in?
  #end
  
end
