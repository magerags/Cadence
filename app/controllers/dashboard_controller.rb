class DashboardController < ApplicationController
  def show
    @hours_by_category = Event.amount_of_hours(current_user)
    total_Hours_Service = RemainingHoursService.new(current_user)
    @hours_left = total_Hours_Service.perform
    @upcoming_event = Event.events_today(current_user, Date.today).reject do |event|
      event.starting_time < Time.now
    end

    @upcoming_event = @upcoming_event.sort_by {|i| i.starting_time}.first
  end
end
