class UserController < ApplicationController
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
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("user/userLogin")
    end
  end

end
