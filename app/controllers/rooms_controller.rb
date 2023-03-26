class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    render json: @rooms.as_json
  end

  def show
    @room = Room.find_by(id: params[:id])
    render json: @room.as_json
  end

  def create
    @room = Room.new(
      user_id: current_user.id,
      address: params[:address],
      city: params[:city],
      state: params[:state],
      price: params[:price],
      description: params[:description],
      home_type: params[:home_type],
      room_type: params[:room_type],
      total_occupancy: params[:total_occupancy],
      total_bedrooms: params[:total_bedrooms],
      total_bathrooms: params[:total_bathrooms],
    )
    if @room.save
      render json: { message: "room created" }
    else
      render json: { errors: @room.errors.full_messages }, status: 422
    end
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.update(
      price: params[:price] || @room.price,
      description: params[:description] || @room.description,
      home_type: params[:home_type] || @room.home_type,
      room_type: params[:room_type] || @room.room_type,
    )
    if @room.valid?
      render json: @room.as_json
    else
      render json: { message: @room.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    render json: { message: "Succesfully deleted the room!" }
  end
end
