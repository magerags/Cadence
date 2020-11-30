class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]


  def index
    @goals = Goal.order('id ASC')

  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path
    else

      render :new
    end
  end

  def edit
  end

  def update
    @goal.update(goal_params)
    redirect_to goals_path
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:goaltime, :category_id)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
