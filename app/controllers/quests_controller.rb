class QuestsController < ApplicationController

  def index
    @quests = Quest.all
    if params[:sort] == 'asc'
      @quests = Quest.order(reward: :asc)
    elsif params[:sort] == 'desc'
      @quests = Quest.order(reward: :desc)
    end
    if params[:query].present?
      @quests = Quest.search(params[:query])
    end
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user = current_user

    if @quest.save
      flash[:notice] = "Quest was successfully created!"
      redirect_to quest_path(@quest[:id])
    else
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :name, :description, :requirement, :location, :reward)
  end
end
