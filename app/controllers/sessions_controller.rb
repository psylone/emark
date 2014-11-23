class SessionsController < ApplicationController

  skip_before_action :login_required, only: [ :new, :create ]
  before_action :show_dashboard, only: :new

  def new
  end

  def create
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to dashboard, notice: 'Добро пожаловать в Emark!'
    else
      flash.now.alert = 'Неверный email или пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Выход из Emark успешно выполнен!'
  end


  private

  def show_dashboard
    redirect_to dashboard, notice: 'Добро пожаловать в Контекст!' if current_user
  end

  def dashboard
    if current_user.is_teacher?
      subjects_path
    else
      subject_lines_path
    end
  end

end
