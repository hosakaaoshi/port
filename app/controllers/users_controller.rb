class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  @tweet = @user.tweet
  @tweets = Tweet.all
  #@image = Image.find(params[:id])
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  @user.update(user_params)
   redirect_to user_path
 end

 private

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
