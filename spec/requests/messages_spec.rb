require 'rails_helper'

RSpec.describe MessagesController, type: :request do
  let(:room) { create(:room) }
  describe "POST /rooms/:room_id/messages" do
    it "creates a new message" do
      message_params = { message: { content: "Hello!", user_name: "John" } }

      post "/rooms/#{room.id}/messages", params: message_params

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response["content"]).to eq("Hello!")
      expect(json_response["user_name"]).to eq("John")
    end

    it "fails to create a message without content" do
      message_params = { message: { content: "", user_name: "John" } }

      post "/rooms/#{room.id}/messages", params: message_params

      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JSON.parse(response.body)
      expect(json_response["errors"]).to include("Content can't be blank")
    end
  end
end
