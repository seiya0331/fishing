class User::UsersController < ApplicationController
  before_action :set_user, only: [:favorites]
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @tweet_comment = TweetComment.new
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
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
