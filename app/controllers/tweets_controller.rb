class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: %i[show edit update destroy like]

  def index
    @user = current_user
    @user_tweets = @user.tweets.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save

      @hashtag = params[:tweet].to_s.downcase.scan(/#\w+/)
      @hashtag.each do |h|
        @hashtag_search = Hashtag.find_or_create_by(hashtag: h)
        Hashtagstweet.create(tweet: @tweet, hashtag: @hashtag_search)
      end

      redirect_to users_path

    end
  end

  def show
    @reply = Reply.new
    @tweet_user = Tweet.includes(:user).where('id = ?', @tweet.id)
  end

  def edit; end

  def update
    redirect_to users_path if @tweet.update(tweet_params)
  end

  def destroy
    @user = current_user
    @user_tweets = @user.tweets.order(created_at: :desc)
    @tweet = Tweet.find_by(id: params[:id], user_id: current_user.id)
    @tweets = current_user.tweets.order(created_at: :desc) if @tweet.destroy
    @tweet = Tweet.new
  end

  def like
    @user = current_user
    @user_tweets = @user.tweets.order(created_at: :desc)
    @like = Like.new(user: current_user, tweet: Tweet.find(params[:id]))
    @like = Like.new if @like.save
    @tweet = Tweet.new
  end

  def dislike
    @user = current_user
    @user_tweets = @user.tweets.order(created_at: :desc)
    @like = Like.find_by(tweet_id: params[:id], user_id: current_user.id)
    @like.destroy
    @tweet = Tweet.new
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:tweet, :image)
  end

  def like_params
    params.require(:like).permit(:tweet_id, :user_id)
  end
end
