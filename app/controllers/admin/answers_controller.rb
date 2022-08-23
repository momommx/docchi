class Admin::AnswersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @answers = Answer.page(params[:page]).order(created_at: :desc)
  end
  
  def destroy
     @answer = Answer.find(params[:id])
     # Answerテーブルから受け取ったAnswerのidに該当する回答内容を削除する
     Answer.find(params[:id]).destroy 
     redirect_to request.referer
  end
    
end
