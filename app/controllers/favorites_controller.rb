class FavoritesController < ApplicationController
  def create
   @tweet = Tweet.find(params[:tweet_id])
   @favorite = Favorite.new(user_id: current_user.id, tweet_id: @tweet.id)
   # favorite = current_user.favorites.new(tweet_id: @tweet.id)
   @favorite.save
   Notification.save_notification_comment!(current_user, @tweet.user_id, @tweet.id, @comment.id)
   bybug
    render 'favorite/create.js.erb'
  end

  def destroy
   @tweet = Tweet.find(params[:tweet_id])
   favorite = Favorite.find_by(user_id: current_user.id, tweet_id: @tweet.id)
   # favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
   favorite.destroy
   render 'favorite/destroy.js.erb'
  end
end
