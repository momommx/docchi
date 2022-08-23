class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # お題検索で絞り込まれたwordが@topicsに代入される。  
    @topics = Topic.looks(params[:word])
    # ジャンル検索でジャンルが指定された場合、@topicsの中からさらにジャンルを絞り込む。
    @topics = @topics.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    @count = @topics.count
    #ジャンル検索でgenre_idが指定された場合、そのgenre_idのレコードを＠genreに代入。
    @genre = Genre.find(params[:genre_id]) if params[:genre_id].present?
    
    @topics = @topics.page(params[:page])
  end

end