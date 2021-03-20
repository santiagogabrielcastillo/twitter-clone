class TweetsController < ApplicationController

  def home
    @tweets = current_user.followed_tweets.order(created_at: :desc).to_a #shuffle
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
      render :home
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
