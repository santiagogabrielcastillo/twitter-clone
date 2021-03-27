class TweetsController < ApplicationController
  before_action :authenticate_user!

  def home
    @tweets = current_user.followed_tweets.order(Arel.sql('RANDOM()')).limit(10)
    @tweet = Tweet.new
    if params[:keyword]
      @news = News::Search.by_keyword(params[:keyword])
    else
      @news = News::Search.headlines['articles']
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to tweet_root_path_url
    else
      @tweets = current_user.followed_tweets.order(Arel.sql('RANDOM()')).limit(10)
      render :home
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.likes_count.nil?
      @tweet.likes_count = 1
    else
      @tweet.likes_count += 1
    end
    redirect_to tweet_root_path_url(anchor: "tweet-#{@tweet.id}") if @tweet.save
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
