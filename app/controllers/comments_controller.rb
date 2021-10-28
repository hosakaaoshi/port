class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.tweet_id = @tweet.id
    @comment.save
    Notification.save_notification_comment!(current_user, @tweet.user_id, @tweet.id, @comment.id)
    redirect_to tweet_path(@tweet.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end