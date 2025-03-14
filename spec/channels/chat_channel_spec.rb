require 'rails_helper'

RSpec.describe ChatChannel, type: :channel do
  describe "when subscribing" do
    let(:room_id) { 1 }

    it "successfully subscribes with a valid room_id" do
      subscribe(room_id: room_id)

      expect(subscription).to be_confirmed
      expect(subscription.streams).to include("chat_#{room_id}")
    end

    it "rejects subscription without room_id" do
      subscribe

      expect(subscription).to be_rejected
    end
  end

  describe "when unsubscribing" do
    let(:room_id) { 1 }

    it "successfully unsubscribes from a stream" do
      subscribe(room_id: room_id)
      
      expect(subscription).to be_confirmed
      expect(subscription.streams).to include("chat_#{room_id}")
      
      unsubscribe

      expect(subscription).to_not have_stream_from("chat_#{room_id}")
    end
  end
end
