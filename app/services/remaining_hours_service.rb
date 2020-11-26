class RemainingHoursService
  def initialize(user)
    @user = user
  end

  def perform
    total_hours - (work_hours + sleeping_hours + event_hours)
  end

  private

  def work_hours
    @user.user_setting.work_hours(@user)
  end

  def sleeping_hours
    @user.user_setting.sleeping_hours(@user)
  end

  def event_hours
    Event.amount_of_hours(@user).values.sum
  end

  def total_hours
    24 * 7
  end
end
