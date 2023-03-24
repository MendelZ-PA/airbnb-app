class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    render json: @rooms.as_json
  end
  
  def create
    @room = Room.new(
      user_id: params[:user_id],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      price: params [:price],
      description: params [:description],
      home_type: params [:home_type],
      room_type: params [:room_type],
      total_occupancy: params [:total_occupancy],
      total_bedrooms: params [:total_bedrooms], 
      total_bathrooms: params [:total_bathrooms],
    )
    if @room.save
      render json: { message: "room created"}
    else
      render json: { errors: @room.errors.full_messages },status: 422
    end  
  end
end
