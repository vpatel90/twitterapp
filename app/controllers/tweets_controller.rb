class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = get_tweet_at_id
  end

  private

  def get_tweet_at_id
    Tweet.find_by(id: params["id"].to_i)
  end
end
