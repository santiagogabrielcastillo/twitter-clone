class TweetsController < ApplicationController

  def home
    @tweets = current_user.followed_tweets.shuffle
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
