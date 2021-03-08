module RoomsHelper

  def chat_room?(user)
    current_user_rooms = UserRoom.where(user_id: current_user.id)
    show_user_rooms = UserRoom.where(user_id: user.id)
    current_user_rooms.each do |croom|
      show_user_rooms.each do |sroom|
        if croom.room_id == sroom.room_id
          @room = sroom.room_id
          return true
        end
      end
    end
    return false
  end
end
