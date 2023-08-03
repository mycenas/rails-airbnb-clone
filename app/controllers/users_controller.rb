class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end

  def requests
    @user = current_user
    @bookings = Booking.where(quest: @user.quests)
  end

  def my_bookings
    @bookings = current_user.bookings
  end

end
