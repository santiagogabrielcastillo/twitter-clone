class TweetsController < ApplicationController
  before_action :authenticate_user!

  def home
    @tweets = current_user.followed_tweets.order(Arel.sql('RANDOM()')).limit(10)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to home_path
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
    redirect_to home_path(anchor: "tweet-#{@tweet.id}") if @tweet.save
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
