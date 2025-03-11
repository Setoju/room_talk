class RoomChannel < ApplicationCable::Channel
  def subscribed
    if params[:room_id].present?
      @room = Room.find(params[:room_id])
      stream_from "room_#{params[:room_id]}"
      Rails.logger.debug "Subscribed to room_#{params[:room_id]}"
    else
      reject
    end
  end

  def unsubscribed
    Rails.logger.debug "Unsubscribed from room"
    stop_all_streams
  end
end
