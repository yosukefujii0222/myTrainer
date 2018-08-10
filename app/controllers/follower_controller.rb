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
end
