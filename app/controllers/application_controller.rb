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

  # Bootstrap対応のフラッシュメッセージ表示
  add_flash_types :success, :info, :warning, :danger

  protected

  #Sign_upの際に、ユーザー名(name)のデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  
end
