class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @topics = Topic.all
    @topics = Topic.looks(params[:word])
  end

end

