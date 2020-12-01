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
  end

  private

  def user_setting_params
    params.require(:user_setting).permit(:name, :bed_time, :wake_time, :work_start, :work_end)
  end
end
