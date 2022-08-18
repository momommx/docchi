class Public::AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @answer = Answer.new(answer_params)
    
    @answer.user_id = @user.id
    @answer.topic_id = @topic.id
    
    if @answer.save
      flash[:success] = '１票入りました！'
      redirect_to public_topic_path(@topic)
    else
      flash[:danger] = ' 投票できませんでした。票とコメントの両方を入力してください。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    answer = @topic.answers.find(params[:id])
    answer.destroy
    redirect_to request.referer
  end
  
  
  private

  def answer_params
    params.require(:answer).permit(:answer_content, :option)
  end

end
