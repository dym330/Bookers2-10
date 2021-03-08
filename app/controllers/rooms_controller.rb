class RoomsController < ApplicationController
  include RoomsHelper

  def show
    @chat = Chat.new
    @user_rooms = UserRoom.where(room_id: params[:id])
    @user_rooms.each do |user_room|
      if user_room.user_id == current_user.id
        @login_check = true
      else
        @chat_user = User.find(user_room.user_id)
        @room_id = user_room.room_id
      end
    end
    redirect_to root_path unless @login_check
    @chats = Chat.where(room_id: @room_id)
  end

  def create
    @chat_user = User.find(params[:opponent])
    unless chat_room?(@chat_user)
      @room = Room.create
      @user_room1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
      @user_room2 = UserRoom.create(room_id: @room.id, user_id: @chat_user.id)
    end
    redirect_to room_path(@room)
  end
end
