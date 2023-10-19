class Admin::UsersController < ApplicationController
  def
    @users = User.all.page(params[:page]).per(10)
  end
end
