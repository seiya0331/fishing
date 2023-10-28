class User::TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.page(params[:page])
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
      if  tweet.update(tweet_params)
          redirect_to tweet_path(tweet.id)
          flash[:notice] = "更新しました。"
      else
          flash.now[:alert] = "更新できませんでした。"
          render "edit"
      end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to tweet_path(@tweet)
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
