class User::TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all
    @tweet_comment = TweetComment.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweet_comment = TweetComment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to tweet_path(tweet.id)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to tweets_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text)
  end
end
