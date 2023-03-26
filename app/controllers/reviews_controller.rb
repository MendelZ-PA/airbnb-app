class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render json: @reviews.as_json
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
end
