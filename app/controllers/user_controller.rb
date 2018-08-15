class UserController < ApplicationController

  before_action :authenticate_user,{only: [:logout, :show]}
  before_action :forbid_login_user,{only: [:new, :create]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      idealWeight: params[:idealWeight],
      gender: params[:gender],
      height: params[:height],
      weight: params[:weight],
      age: params[:age]
    )

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました！"
      redirect_to("/")
    else
      render("/user/new")
    end
  end

  def userLogin
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("user/userLogin")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def show
    @user = User.find_by(params[:id])
    @applying = Follower.where(user_id: "#{params[:id]}", status: 1)
    @approved = Follower.where(user_id: "#{params[:id]}", status: 2)
    @paid = Follower.where(user_id: "#{params[:id]}", status: 3)
  end



end
