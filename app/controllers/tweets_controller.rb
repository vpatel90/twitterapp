class TweetsController < ApplicationController
  def index
    @page = params[:page] || "1"
    if params[:search].nil?
      @tweets = get_tweets
    else
      @tweets = get_tweets_by_search
    end
  end

  def show
    @tweet = get_tweet_at_id
  end

  def new
    @error = params[:error]
  end

  def create
    user = User.first
    Tweet.create(body: params[:body], user_id: user.id)
    redirect_to "/"
  end

  def edit
    @tweet = get_tweet_at_id
    @error = params[:error]
  end

  def update
    @tweet = get_tweet_at_id
    @tweet.body = params[:body]
    @tweet.save
    redirect_to "/tweets/#{@tweet.id}"
  end

  private

  def get_tweet_at_id
    Tweet.find_by(id: params[:id].to_i)
  end

  def get_tweets
    Tweet.order(updated_at: :desc).limit(25).offset((@page.to_i - 1)*25)
  end

  def get_tweets_by_search
    Tweet.where("body LIKE '%#{params[:search]}%'").order(updated_at: :desc).limit(25).offset((@page.to_i - 1)*25)
  end
end
