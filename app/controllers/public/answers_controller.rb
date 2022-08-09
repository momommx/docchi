class Public::AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @user = @topic.user
    answer_content = current_user.answers.new(answer_params)
    answer_content.topic_id = @topic.id
    answer_content.save
    redirect_to public_topic_path(topic)
  end
  
  def destroy
  end
  
  
  private

  def answer_params
    params.require(:answer).permit(:answer_content)
  end

end
