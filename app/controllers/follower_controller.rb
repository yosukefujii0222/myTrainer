class FollowerController < ApplicationController

  def create
    @follower = Follower.new(trainer_id: params[:trainer_id], user_id: @current_user.id, status: 1)
    @follower.save
    redirect_to("/trainer/#{params[:trainer_id]}")
  end

  def approve
    @follower = Follower.find_by(trainer_id: params[:trainer_id], user_id: params[:user_id], status: 1)
    @follower.status = 2
    @follower.save
    redirect_to("/trainer/#{params[:trainer_id]}/manage")
  end

  def pay
    @follower = Follower.find_by(user_id: params[:user_id], trainer_id: params[:trainer_id], status: 2)
    @follower.status = 3
    @follower.save
    redirect_to("/user/#{params[:user_id]}")
  end

end
