class TrainerController < ApplicationController
  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      speciality: params[:speciality],
      gender: params[:gender],
      height: params[:height],
      weight: params[:weight],
      age: params[:age],
      career: params[:career]
    )
    if params[:image]
      @trainer.image = "#{@trainer.email}.jpg"
      imageData = params[:image]
      File.binwrite("public/trainer_images/#{@trainer.image}", imageData.read)
    end
    if @trainer.save
      flash[:notice] = "トレーナー登録が完了しました！"
      redirect_to("/")
    else
      render("/trainer/new")
    end
  end

  def trainerLogin
  end

  def login
    @trainer = Trainer.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @trainer
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("trainer/trainerLogin")
    end
  end


end
