class ViewPurseController < ApplicationController
before_action :authenticate_user!
before_action :set_user, only: [:view_purse, :view_stats, :view_abilities]

def view_purse
  # an adventurer can view their purse and see how many coins is inside
  @coins = @user.coins
  @current_action = "view_purse"
end

def view_stats
  # an adventurer can view their stats
@current_action = "view_abilities"
end

def view_abilities
  # an adventurer can view their abilities
@current_action = "view_abilities"
end

private

def set_user
  @user = current_user
end
