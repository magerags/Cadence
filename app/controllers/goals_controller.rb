class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]


  def index
    @goals = Goal.order('id ASC')

  end

  def new
    @goal = Goal.new
  end

  def create
    id, class_name = JSON.parse(params[:goal][:category])
    category = class_name.constantize.find(id)
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    category_class = class_name.downcase == ("category") ? ("category_id") : ("user_categories_id")
    @goal.send("#{category_class}=", category.id)
    if @goal.save!
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
    params.require(:goal).permit(:goaltime)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
