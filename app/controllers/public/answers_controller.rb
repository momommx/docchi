class Public::AnswersController < ApplicationController
  #ログインしている場合、投稿&削除可能
  before_action :authenticate_user!

  def create
  end
  
  def destroy
  end
  
end
