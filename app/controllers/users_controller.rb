class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def send_coins
    # a DM can send coins to adventurer after the quest is complete
    @dm = current_user
    @adventurer = User.find(params[:adventurer_id])
    coins_to_send = params[:coins].to_i

    if @dm.purse >= coins_to_send && coins_to_send > 0
      @dm.purse -= coins_to_send
      @adventurer.coins += coins_to_send
      @dm.save
      @adventurer.save
      redirect_to adventurer_stats(@adventurer), notice: "#{coins_to_send} sent!"
    else
      redirect_to adventurer_stats(@adventurer, alert: "Sorry, I don't have coins to send.")
    end
  end
end
