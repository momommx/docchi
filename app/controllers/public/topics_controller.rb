class Public::TopicsController < ApplicationController
  before_action :authenticate_user!
  
  #ログインしている場合、投稿可能
  #before_action :authenticate_user!, only: [:new]
  
  #skip_before_action :login_required, only: [:index, :show]
  
  def index
    @user = current_user
    
    if params[:latest]
      @topics = Topic.latest
    elsif params[:old]
      @topics = Topic.old
    else
      @topics = Topic.all
    end
  end
  
  def show
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @created_topic = Topic.new(topic_params)
    @created_topic.option1 = topic.option1
    @created_topic.option2 = topic.option2
    @created_topic.genre = topic.genre_id 
    @created_topic.save
    redirect_to public_topics_path
  end
  
  
  private

  def topic_params
    params.require(:topic).permit(:topic_title, :option1, :option2, :genre_id, :user_id)
  end
  
end
