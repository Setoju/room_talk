class MessagesController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    message = room.messages.build(message_params)

    if message.save
      render json: message, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_name)
  end
end
