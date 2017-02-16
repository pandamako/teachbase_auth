class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(user_url @user, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(login_url, notice: 'Logged out!')
  end
end
