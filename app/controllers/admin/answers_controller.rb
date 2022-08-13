class Admin::AnswersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @answers = Answer.all
  end
  
  def destroy
     @answer = Answer.find(params[:id])
     # Answerテーブルから受け取ったAnswerのidに該当する回答内容を削除する
     Answer.find(params[:id]).destroy 
     redirect_to request.referer
  end
    
end
