class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @topics = Topic.page(params[:page])
    @topics = Topic.looks(params[:word])
  end

end

