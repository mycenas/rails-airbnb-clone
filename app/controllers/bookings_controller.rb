class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @bookings = Booking.find(params[:id])
  end

  def edit
    @bookings = Booking.find(params[:id])
  end
end
