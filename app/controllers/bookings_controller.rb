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
    redirect_back(fallback_location: root_path, notice: 'Booking accepted')
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 'declined')
    redirect_back(fallback_location: root_path, notice: 'Booking declined')
  end

  def complete
    @booking = Booking.find(params[:id])
    if @booking.status == 'accepted'
      @booking.update(status: 'completed')
      @booking.user.purse += @booking.quest.reward
      @booking.user.save
      redirect_to booking_path(@booking), notice: 'Booking marked as completed'
    else
      redirect_to booking_path(@booking), notice: 'Cannot mark as completed. Booking not accepted yet.'
    end
  end

  def cancel
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @booking.update(status: 'cancelled')
      redirect_to my_bookings_path, notice: 'Booking was successfully cancelled.'
    else
      redirect_to my_bookings_path, alert: 'You are not authorized to cancel this booking.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to user_requests_path(current_user), notice: 'Booking was successfully deleted.'
    else
      redirect_to user_requests_path(current_user), alert: 'Unable to delete booking.'
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
