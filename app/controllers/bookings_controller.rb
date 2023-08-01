class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :accept, :decline]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to bookings_path, notice: 'Booking was successfully accepted.'
  end

  def decline
    @booking.update(status: "declined")
    redirect_to bookings_path, notice: 'Booking was successfully declined.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:quest_id, :user_id, :status)
  end
end
