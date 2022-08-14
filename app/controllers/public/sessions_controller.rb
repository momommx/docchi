# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  
  # 退会しているかを判断するメソッド
  def user_state
    @user = User.find_by(email:params[:user][:email])                                   # 入力されたemailからアカウントを1件取得
    return if !@user                                                                    # 取得できなかった場合、この処理を終了
      if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true    # 取得したパスワードと入力されたパスワードが一致している, そしてis_deletedの値がtrueだった場合
        redirect_to new_user_session_path, danger: "管理者によってアカウントを停止されています。"
      end
  end

end
