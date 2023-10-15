class User::UsersController < ApplicationController
  before_action :set_user, only: [:favorites]
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweet_comment = TweetComment.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def favorites
    fovorites = Favorite.where(user_id: @user.id).pluck(:tweet_id)
    @tweets = Tweet.find(fovorites)
    @tweet_comment = TweetComment.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
