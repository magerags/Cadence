class DashboardController < ApplicationController
  def show
    @hours_by_category = Event.amount_of_hours(current_user)
    total_Hours_Service = RemainingHoursService.new(current_user)
    @hours_left = total_Hours_Service.perform
  end
end
