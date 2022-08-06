class Public::TopicsController < ApplicationController
  
  #非ログイン時でも一覧と詳細ページは閲覧可能
  skip_before_action :login_required, only: [:index, :show]
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  
end
