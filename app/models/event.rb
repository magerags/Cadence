class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :user_category, optional: true

  def self.amount_of_hours(current_user)
    events = current_user.events.where("date(starting_time) >= date(?)", Date.today)
    events.reduce({}) do |acc, event|
      time = (event.ending_time - event.starting_time) / 3600
      current_category = event.get_category
      if acc[current_category.name].nil?
         acc[current_category.name] = time
      else
        acc[current_category.name] += time
      end
      acc
    end
  end

  def self.events_today(user, date)
    user.events.where("date(starting_time) >= ? and date(ending_time) <= ?", date, date)

  end

  def get_category
    self.category.nil? ? UserCategory.find(self.user_categories_id) : self.category
  end
end


#.pluck(:starting_time, :ending_time)
