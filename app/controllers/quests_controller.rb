class QuestsController < ApplicationController

  def index
    @quests = Quest.all
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(params[quest_params])

    if @quest.save
      flash[:notice] = "Quest was successfully created!"
      # redirect_to @quest # redirect to show page once that's been implemented
    else
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
  end

  private

  def quest_params
    params.require(:quest).permit(:name, :description, :requirement, :location, :reward, :user)
  end

end
