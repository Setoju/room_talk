require 'rails_helper'

RSpec.describe Message, type: :model do
  room = Room.new(name: "Room 1")
  message = Message.new(room: room, user_name: "Alice", content: "Hello, World!")

  it "is valid with a content" do
    expect(message).to be_valid
  end

  it "is invalid without a content" do
    message.content = nil
    expect(message).to_not be_valid
  end

  it "is invalid without a user_name" do
    message.user_name = nil
    expect(message).to_not be_valid
  end
end