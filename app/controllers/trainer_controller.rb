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
      session[:trainer_id] = @trainer.id
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
      session[:trainer_id] = @trainer.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("trainer/trainerLogin")
    end
  end

  def logout
    session[:trainer_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def show
    @trainer = Trainer.find_by(id: params[:id])
  end

  def edit
    @trainer = Trainer.find_by(id: params[:id])
  end

  def update
    @trainer = Trainer.find_by(id: params[:id])
    @trainer.name = params[:name]
    @trainer.email = params[:email]
    @trainer.password = params[:password]
    @trainer.speciality = params[:speciality]
    @trainer.gender = params[:gender]
    @trainer.height = params[:height]
    @trainer.weight = params[:weight]
    @trainer.age = params[:age]
    @trainer.career = params[:career]
    if params[:image]
      @trainer.image = "#{@trainer.email}.jpg"
      imageData = params[:image]
      File.binwrite("public/trainer_images/#{@trainer.image}", imageData.read)
    end
    if @trainer.save
      flash[:notice] = "トレーナー登録情報を更新しました！"
      redirect_to("/trainer/#{params[:id]}")
    else
      render("trainer/edit")
    end
  end


end
