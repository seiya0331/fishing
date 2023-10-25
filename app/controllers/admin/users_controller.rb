class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def show
    @user= User.find(params[:id])
  end

  def destroy
    user= User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end
end
