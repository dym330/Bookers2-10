class ChatsController < ApplicationController

  def create
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id
    if @chat.save
    end
    @chats = Chat.where(room_id: @chat.room_id)
  end


  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
