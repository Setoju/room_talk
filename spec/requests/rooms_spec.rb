require 'rails_helper'

RSpec.describe RoomsController, type: :request do
  describe "GET /rooms" do
    it "returns a list of rooms" do
      create_list(:room, 3)
      
      get "/rooms"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(3)
    end
  end

  describe "GET /rooms/:id" do
    it "returns a room and its messages" do
      room = create(:room)
      create_list(:message, 2, room: room)
  
      get "/rooms/#{room.id}"
  
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
  
      expect(json_response["room"]["id"]).to eq(room.id)
      expect(json_response["messages"].length).to eq(2)
    end
  end

  describe "POST /rooms" do
    it "creates a new room" do
      room_params = { room: { name: "Chat Room" } }
  
      post "/rooms", params: room_params
  
      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq("Chat Room")
    end
  
    it "fails to create a room without a name" do
      post "/rooms", params: { room: { name: "" } }
  
      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JSON.parse(response.body)
      expect(json_response["errors"]).to include("Name can't be blank")
    end
  end
end
