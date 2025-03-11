class ChatChannel < ApplicationCable::Channel
  def subscribed
    if params[:room_id].present?
      stream_name = "chat_#{params[:room_id]}"
      Rails.logger.info "Subscribing to #{stream_name}"
      stream_from stream_name
    else
      reject
    end
  end

  def unsubscribed
    Rails.logger.info "Unsubscribed from chat channel"
    stop_all_streams
  end
end
