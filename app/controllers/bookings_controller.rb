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
      redirect_to booking_path(@booking), notice: 'Enlistment was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'accepted')
    redirect_back(fallback_location: root_path, notice: 'Enlistment accepted')
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: 'declined')
    redirect_back(fallback_location: root_path, notice: 'Enlistment declined')
  end

  def complete
  @booking = Booking.find(params[:id])
  if @booking.status == 'accepted'
    current_user_purse = current_user.purse || 0
    if current_user_purse >= @booking.quest.reward
      @booking.update(status: 'completed')
      current_user.purse -= @booking.quest.reward
      @booking.user.purse += @booking.quest.reward
      current_user.save
      @booking.user.save
      redirect_back(fallback_location: root_path, notice: 'Reward was sent successfully!')
    else
      redirect_back(fallback_location: root_path, notice: 'Insufficient coins in your purse.')
    end
  else
    redirect_to booking_path(@booking), notice: 'Reward was not sent. Enlistment not accepted yet.'
  end
end

  def cancel
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @booking.update(status: 'cancelled')
      redirect_to my_bookings_path, notice: 'Enlistment was successfully withdrawn.'
    else
      redirect_to my_bookings_path, alert: 'You are not able to withdraw this enlistment.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to user_requests_path(current_user), notice: 'Enlistment was sent to the void.'
    else
      redirect_to user_requests_path(current_user), alert: 'Unable to remove the enlistment.'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:message, :status, :quest_id)
  end

end
