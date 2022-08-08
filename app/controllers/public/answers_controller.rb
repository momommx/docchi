class Public::AnswersController < ApplicationController
  #ログインしている場合、投稿&削除可能
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @answer = current_user.answers.new(answer_params)
    @answer.topic_id = topic.id
    @answer.save
    redirect_to public_topic_path(topic.id)
  end
  
  def destroy
  end
  
  
  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

end
