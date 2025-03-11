class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_name = "chat_#{params[:room_id]}"
    Rails.logger.info "Subscribing to #{stream_name}"
    stream_from stream_name
  end

  def unsubscribed
    Rails.logger.info "Unsubscribed from chat channel"
  end
end
