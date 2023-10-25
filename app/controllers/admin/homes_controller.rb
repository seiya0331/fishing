class Admin::HomesController < ApplicationController
  def top
    @users = User.all.page(params[:page]).per(5)
  end
end
