class RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def create
    # Add debug logging
    Rails.logger.debug "Room params: #{params.inspect}"
    Rails.logger.debug "Room parameters: #{room_params.inspect}"

    room = Room.new(room_params)
    if room.save
      render json: room, status: :created
    else
      Rails.logger.debug "Room errors: #{room.errors.full_messages}"
      render json: { errors: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    room = Room.find(params[:id])
    messages = room.messages.order(created_at: :asc)
    render json: { room: room, messages: messages }
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
