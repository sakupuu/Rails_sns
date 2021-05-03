class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets
  end
end
