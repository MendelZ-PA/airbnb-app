class ReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @reviews = Review.all
    render json: @reviews.as_json
  end

  def show
    @review = Review.find_by(id: params[:id])
    render json: @review.as_json
  end

  def create
    @review = Review.new(
      reservation_id: params[:reservation_id],
      rating: params[:rating],
      comment: params[:comment],
    )
    if @review.save
      render json: { message: "review created" }
    else
      render json: { errors: @review.errors.full_messages }, status: 422
    end
  end

  def update
    @review = current_user.reviews.find_by(id: params[:id])
    @review.update(
      rating: params[:rating] || @review.rating,
      comment: params[:comment] || @review.comment,
    )
    if @review.valid?
      render json: @review.as_json
    else
      render json: { message: @review.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @review = current_user.reviews.find_by(id: params[:id])
    @review.destroy
    render json: { message: "successfully deleted, hope you consider us for your future reservations!" }
  end
end
