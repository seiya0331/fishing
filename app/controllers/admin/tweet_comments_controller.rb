class Admin::TweetCommentsController < ApplicationController
  def index
    @comments = TweetComment.all.page(params[:page]).per(5)
  end

  def show
    @comment = TweetComment.find(params[:id])
  end

  def destroy
    @comment = TweetComment.find(params[:id])
    @comment.destroy
    redirect_to admin_tweet_comments_path
  end
end
