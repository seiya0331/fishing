class Admin::TweetsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tweets = Tweet.all.page(params[:page]).per(5)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to admin_tweets_path
  end
end
