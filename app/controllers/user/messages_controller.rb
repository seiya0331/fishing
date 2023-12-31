class User::MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    if Entry.where(user_id: current_user.id, room_id: message_params[:room_id]).present?
      @message = Message.create(message_params)
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id).merge(user_id: current_user.id)
  end
end
