class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to venues_path, notice: "Welcome to Rock-a-Party, #{@user.firstname}!"
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :email_confirmation, :password, :birthday, :gender)
  end
end