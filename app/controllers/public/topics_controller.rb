class Public::TopicsController < ApplicationController
  before_action :authenticate_user!
  
  #ログインしている場合、投稿可能
  #before_action :authenticate_user!, only: [:new]
  #skip_before_action :login_required, only: [:index, :show]
  
  def index
    @user = current_user
    @topic = Topic.new
    @topics = Topic.all
    
    #if params[:latest]
      #@topics = Topic.latest
    #elsif params[:old]
     # @topics = Topic.old
    #else
     # @topics = Topic.all
    #end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @user = @topic.user
    @answer = Answer.new
    
    # 回答欄のラジオボタンの分岐
    if params[:answer][:select_option] == "0"  #どちらでもない派
      @answer.option = current_user.option3  
      @answer.save
    elsif params[:answer][:select_option] == "1" #A派
      @answer.option = current_user.option1
      @answer.save
    elsif params[:answer][:select_option] == "2" #B派
      @answer.option = current_user.option2
      @answer.save
    else
      @alart = "票が選択されていません。"
    end
      
    # @answers = @answer.answer_content.page(params[:page]).per(7).reverse_order
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      
      flash[:notice] = "あなたのお題ができました。" 
      redirect_to public_topic_path(@topic.id)
    else
      flash[:notice] = "お題が作成できませんでした。" 
      @user = current_user
      @topics = Topic.all
      redirect_to public_topics_path
    end
  end
  
  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to request.referer
  end
  
  private

  def topic_params
    params.require(:topic).permit(:topic_title, :option1, :option2, :genre_id, :user_id)
  end
  
  # def answer_params
    # params.require(:answer).permit(:option, :answer_content)
  # end
  
end
