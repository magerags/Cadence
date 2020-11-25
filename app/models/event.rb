class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def self.amount_of_hours(current_user)
    hours = current_user.events.where("date(starting_time) >= date(?)", Date.today).pluck(:starting_time, :ending_time)
    hours.reduce(0.0) do |acc, hour|
     time = (hour[1] - hour[0]) / 3600
     acc += time
     acc

    end
end
end
