class ReservationsController < ApplicationController
  before_action :authenticate_user

  def index
    @reservations = Reservation.all
    render json: @reservations.as_json
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
    render json: @reservation.as_json
  end

  # create a reservation
  def create
    price = Room.find_by(id: params[:room_id]).price
    tax = price * 0.09
    total = price + tax
    @reservation = Reservation.new(
      user_id: current_user.id,
      room_id: params[:room_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      price: price,
      tax: tax,
      total: total,
    )
    if @reservation.save
      render json: @reservation.as_json, status: :created
    else
      render json: { message: @reservation.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @reservation.destroy
    render json: { message: "Succesfully deleted the reservation!" }
  end
end
