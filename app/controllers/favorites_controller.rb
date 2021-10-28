class FavoritesController < ApplicationController
  def create
   @tweet = Tweet.find(params[:tweet_id])
   @favorite = Favorite.new(user_id: current_user.id, tweet_id: @tweet.id)
   @favorite.save
   Notification.save_notification_comment!(current_user, @tweet.user_id, @tweet.id, @comment.id)
    render 'favorites/create.js.erb'
  end

  def destroy
   @tweet = Tweet.find(params[:tweet_id])
   favorite = Favorite.find_by(user_id: current_user.id, tweet_id: @tweet.id)
   favorite.destroy
   render 'favorites/destroy.js.erb'
  end
end
