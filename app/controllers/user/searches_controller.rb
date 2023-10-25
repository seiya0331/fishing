class User::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @tweet_comment = TweetComment.new

    # 選択したモデルに応じて検索を実行
    if @model  == "user"
      @records = User.search_for(@content, @method).page(params[:page])
    else
      @records = Tweet.search_for(@content, @method).page(params[:page])
    end
  end
end
