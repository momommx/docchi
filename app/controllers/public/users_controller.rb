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
    

  end
 
 
  private
 
  def set_user
    @user = User.find(params[:id])
  end
 
end
