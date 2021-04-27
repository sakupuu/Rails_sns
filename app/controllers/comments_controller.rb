class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    @comment = tweet.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find_by(id: params[:id],tweet_id: params[:tweet_id]).destroy
    redirect_to tweets_path
  end

  def edit 
    Comment.find_by(id: params[:id],tweet_id: params[:tweet_id])
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
