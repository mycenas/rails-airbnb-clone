class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :accept, :decline]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @quest = Quest.find(params[:quest_id])
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.quest = Quest.find(params[:booking][:quest_id])
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'accepted')
    redirect_to booking_path(@booking), notice: 'Booking accepted'
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 'declined')
    redirect_to booking_path(@booking), notice: 'Booking declined'
  end

  def complete
    @booking = Booking.find(params[:id])
    if @booking.status == 'accepted'
      @booking.update(status: 'completed')
      redirect_to booking_path(@booking), notice: 'Booking marked as completed'
    else
      redirect_to booking_path(@booking), notice: 'Cannot mark as completed. Booking not accepted yet.'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :quest_id)
  end
end
