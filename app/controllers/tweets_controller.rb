class TweetsController < ApplicationController

  def home
    @tweets = current_user.followed_tweets.limit(50).order(created_at: :desc).to_a #shuffle
    current_user.tweets.each do |tweet|
      @tweets << tweet
    end
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to home_path
    else
      @tweets = current_user.followed_tweets.limit(50).order(created_at: :desc).to_a #shuffle
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
    redirect_to home_path if @tweet.save
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
