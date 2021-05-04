class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  

  def new
    @tweet = Tweet.new
  end 

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @comments = @tweet.comments
    @comment = @tweet.comments.build
  end

  def create
    @tweet = Tweet.new(tweet_params)   
    @tweet.user_id = current_user.id 
    @tweet.save
    redirect_to tweets_path
  end

  def admin_tweet
    # ID1番をAdminとする（データの扱い方よくないけど例として）
    admin_tweets_count = Tweet.admin_tweets_count
    p admin_tweets_count
    # render json: admin_tweets_count

    # ユーザーのツイートを管理者として投稿したように改変する
    # 運用ではないことだが例として
    not_admin_tweet = Tweet.where.not(
      user_id: 1
    ).first
    
    render json: not_admin_tweet.update_to_admin if not_admin_tweet.present?
    
    render json: "投稿ないよー"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body) 
  end
end