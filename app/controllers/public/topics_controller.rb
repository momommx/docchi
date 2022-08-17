class Public::TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @topic = Topic.new
    @topics = Topic.includes(:answers).order(created_at: :desc)
    
    # いいねの多い順
    if params[:sort] == "favorite_count"   
      @topics = @topics.sort{|a, b| b.favorites.count <=> a.favorites.count }
    
    # 発言数の多い順
    elsif params[:sort] == "answer_count"
      @topics = @topics.sort{|a, b| b.answers.count <=> a.answers.count }
    end
    
    @topics = Kaminari.paginate_array(@topics).page(params[:page])
  end
  
  def show
    @topic = Topic.find(params[:id])
    @user = @topic.user
    @answer = Answer.new
    @answers = Answer.where(topic_id: @topic.id)
    # @answersの中のcurrent_user.idを含むデータを@user_answerに代入する。
    @user_answer = @answers.where(user_id: current_user.id)
    
    # A,B,C票ごとの合計票数
    @count_a = Topic.joins(:answers).where(answers: {option: "1"}, id: @topic.id).count
    @count_b = Topic.joins(:answers).where(answers: {option: "2"}, id: @topic.id).count
    @count_c = Topic.joins(:answers).where(answers: {option: "0"}, id: @topic.id).count
  
    # A,B,C票ごとのテーブル表示アイコン
    @answer_latest = @answers.order('created_at DESC').limit(4)      # 矢印アイコン: 最新の投票内容を4つ表示
    @answer_a = @answers.where(option: "1")
    @answer_b = @answers.where(option: "2")
    @answer_c = @answers.where(option: "0")
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      flash[:notice] = "お題が投稿できました！" 
      redirect_to public_topics_path
    else
      render :new
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
  
end
