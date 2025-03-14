require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create(:room) }

  it "is valid with a name" do
    expect(room).to be_valid
  end

  it "has many messages" do
    expect(room.messages).to be_empty
  end

  it "is invalid without a name" do
    room.name = nil
    expect(room).to_not be_valid
  end

  it "is invalid if name isn't unique" do
    room
    new_room = build(:room, name: room.name)
    expect(new_room).to_not be_valid
  end
end
