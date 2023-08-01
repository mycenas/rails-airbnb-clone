class PagesController < ApplicationController
  def profile
    @user = current_user

    render 'profile'
  end
end
