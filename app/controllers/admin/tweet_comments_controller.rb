class Admin::TweetCommentsController < ApplicationController
  def index
    @comments = Tweet_Comment.all.page(params[:page]).per(10)
  end
  
  def show
    @comment = Tweet_Comment.find(params[:id])
  end
end
