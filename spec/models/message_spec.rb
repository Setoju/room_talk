require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { create(:message) }

  it "is valid with a content" do
    expect(message).to be_valid
  end

  it "belongs to a room" do
    expect(message.room).to be_present
  end

  it "calls broadcast_message after creation" do
    room = create(:room)
    expect {
      create(:message, room: room, content: "Hello, world!")
    }.to have_broadcasted_to("chat_#{room.id}")
  end

  it "is invalid without a room" do
    message.room = nil
    expect(message).to_not be_valid
  end

  it "is invalid if content is too long" do
    message.content = "a" * 501
    expect(message).to_not be_valid
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