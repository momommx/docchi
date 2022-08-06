class Public::TopicsController < ApplicationController
  #ログインしている場合、投稿可能
  before_action :authenticate_user!, only: [:new]
  
  #skip_before_action :login_required, only: [:index, :show]
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  
end
