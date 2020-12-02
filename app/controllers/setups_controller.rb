class SetupsController < ApplicationController
  def step1_name
    @user_setting = UserSetting.new
  end

  def step2_hours
    @user_setting = UserSetting.new
  end

  def create_step2
    @user_setting = UserSetting.new(user_setting_params)
    @user_setting.user = current_user
    if @user_setting.save
      redirect_to dashboard_path
    else
      render :step2_hours
    end
  end

  def step3_goals
    @categories = current_user.categories
    @goal = Goal.new
    @category = Category.new
  end

  def create_step3
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.category = Category.find(params[:goal][:category])
    if @goal.save!
      respond_to do |format|
        format.js
      end
    else
      render :step3_goals
    end
  end

  def update_step3
    raise
    @goal = Goal.find(params[:id])
    @goal.category = Category.find(params[:goal][:category])
    @goal.update(goal_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def user_setting_params
    params.require(:user_setting).permit(:name, :bed_time, :wake_time, :work_start, :work_end)
  end

  def goal_params
    params.require(:goal).permit(:goaltime)
  end
end
