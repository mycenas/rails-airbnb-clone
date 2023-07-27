class QuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  

  def index
    @quests = Quest.all
  end

  def new
    @new_quest = Quest.new
  end

  def create
    @quest = Quest.new(params[quest_params])
    @quest.save
  end

  def show
    @quest = Quest.find(params[:id])
  end

  private

  def quest_params
    params.require(:quest).permit(:name, :description, :requirement, :location, :reward, :user)
  end

end
