class UserSetting < ApplicationRecord
  belongs_to :user

  def work_hours(current_user)

    worki = current_user.user_setting.work_start
    worko = current_user.user_setting.work_end
    ((worko - worki) * (5 - Date.today.wday)) / 3600
  end

  def sleeping_hours(current_user)
    bedi = current_user.user_setting.bed_time
    waki = current_user.user_setting.wake_time
    ((bedi - waki) * (7 - Date.today.wday)) / 3600

  end
end
