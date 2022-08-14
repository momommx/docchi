class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @topics = Topic.all
    # お題検索で絞り込まれたwordが@topicsに代入される。  
    @topics = Topic.looks(params[:word])
    # ジャンル検索でジャンルが指定された場合、@topicsの中からジャンルを絞り込む。
    @topics = @topics.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    @count = @topics.count
  end

end