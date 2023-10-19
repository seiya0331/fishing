class Admin::TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.page(params[:page]).per(10)
    @tweet_comment = TweetComment.new
  end

   def show
    @tweet = Tweet.find(params[:id])
    @tweet_comment = TweetComment.new
  end
end
