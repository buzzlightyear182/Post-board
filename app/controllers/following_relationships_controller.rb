class FollowingRelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    #because in routing, user_follow POST --> /users/:user_id/follow(.:format)
    current_user.followed_users << user
    redirect_to user
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.followed_users.delete user
    redirect_to user
  end

end
