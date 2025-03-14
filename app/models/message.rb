class Message < ApplicationRecord
  belongs_to :room
  validates :user_name, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  after_create_commit :broadcast_message

  private

  def broadcast_message
    Rails.logger.debug "Broadcasting message: #{attributes}"
    ActionCable.server.broadcast "chat_#{room_id}", {
      id: id,
      content: content,
      user_name: user_name,
      created_at: created_at.strftime("%H:%M:%S")
    }
  end
end
