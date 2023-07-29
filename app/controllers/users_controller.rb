class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :view_purse, :view_stats, :view_abilities]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def view_purse
    # an adventurer can view their purse and see how many coins is inside
    @user = current_user
    @coins = @user.coins
    @current_action = "view_purse"
    render "view_profile"
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

  def view_stats
    # an adventurer can view their stats
  @current_action = "view_abilities"
  render "view_profile"
  end

  def view_abilities -maybe put on profile page
    # and abilities
  @current_action = "view_abilities"
  render "view_profile"
  end

  private

  def set_user
    @user = User.find(params[:id:])
  end
end

  # def assign_stats
    # a DM can assign stat points to an adventurer once quest is complete
  # end

  # def assign_abilities
    # and abilities to an adventurer once quest is complete
  # end


# maybe include index and show page
