class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  def self.amount_of_hours(current_user)
    events = current_user.events.where("date(starting_time) >= date(?)", Date.today)
    events.reduce({}) do |acc, event|
      time = (event.ending_time - event.starting_time) / 3600
      if acc[event.category.name].nil?
         acc[event.category.name] = time
      else
        acc[event.category.name] += time
      end
      acc
    end
  end

  def self.events_today(user, date)
    user.events.where("date(starting_time) >= ? and date(ending_time) <= ?", date, date)
  end
end

#.pluck(:starting_time, :ending_time)
