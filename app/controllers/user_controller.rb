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

end
