class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:favorites]
    
  def show
    @users = User.all
    @user = User.find(params[:id])
    @topics = @user.topics.order(created_at: :desc)
  end 
 
  def favorites
    @user = current_user
    
    # いいねした投稿を探し、@favorite_postsに格納
    favorites = Favorite.where(user_id: @user.id).pluck(:topic_id)
    @favorite_topics = Topic.find(favorites)
    
    # ユーザーがお気に入り登録をした順に表示させる
    @user = User.find(params[:id])
    @favorite_topics = @user.favorites.order(created_at: "DESC").map{|favorite| favorite.topic}
  end
 
  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to public_user_path(@user)
    else
      render :show
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

end