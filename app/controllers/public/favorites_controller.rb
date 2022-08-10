class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
    
  def create
    @topic = Topic.find(params[:topic_id])
    favorite = current_user.favorites.new(topic_id: @topic.id)
    favorite.save
    # app/views/public/favorites/create.js.erbを参照する
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    favorite = current_user.favorites.find_by(topic_id: @topic.id)
    favorite.destroy
    # app/views/public/favorites/destroy.js.erbを参照する
  end

end
