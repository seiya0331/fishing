class User::TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    render :index
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :text)
  end
end
