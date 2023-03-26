class UsersController < ApplicationController
  before_action :authenticate_admin, except: [:create]

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image: params[:image],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      admin: params[:admin],
    )
    if @user.admin == true
      render json: { message: "successfully updated user permissions to admin" }, status: 200
    elsif @user.admin == false
      render json: { message: "successfully removed user admin permissions" }, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end
end
