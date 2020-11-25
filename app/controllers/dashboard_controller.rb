class DashboardController < ApplicationController
  def show

   wh = current_user.user_setting.work_hours(current_user)
   sh = current_user.user_setting.sleeping_hours(current_user)
   eh = Event.amount_of_hours(current_user)
   th = 24 * 7
   #@hours_left = [wh, sh, eh, th]
   @hours_left = th - (wh + sh + eh)
  end
end
