class ProfilesController < ApplicationController
  def profile
   @user_setting = current_user.user_setting
  end

  def edit
  end

  def update
    @current_user.update(current_user_params)
    redirect_to
    profile_path
  end

  private

  def current_user_params
    params.require(:current_user).permit(:email, :password)
  end
end
