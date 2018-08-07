class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    elsif session[:trainer_id]
      @current_user = Trainer.find_by(id: session[:trainer_id])
    end
  end
end
