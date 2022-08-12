class Admin::AnswersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @answers = Answer.all
  end
  
  def destroy
     @answer = Answer.find(params[:id])
     Answer.find(params[:id]).destroy
     redirect_to request.referer
  end
    
end
