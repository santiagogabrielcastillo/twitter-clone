class TweetsController < ApplicationController

  def home
    @tweets = Tweet.all
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
