class ProfilesController < ApplicationController
  def profile
   @user_setting = current_user.user_setting
  end

  def edit
  end

  def update
    current_user.user_setting.update(current_user_params)
    redirect_to profile_path
  end

  private

  def current_user_params
    params.require(:user_setting).permit(:bed_time, :wake_time, :work_start, :work_end, :name)
  end
end
