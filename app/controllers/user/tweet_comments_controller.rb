class User::TweetCommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.tweet_comments.new(tweet_comment_params)
    comment.tweet_id = tweet.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = TweetComment.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end
end
