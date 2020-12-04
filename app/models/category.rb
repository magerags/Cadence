class Category < ApplicationRecord
  has_one :goal
  belongs_to :user

  # validates :name, uniqueness: true

  DEFAULT_CATEGORIES = ['Socialising',
                        'Eating',
                        'Chores',
                        'Relaxing',
                        'Reading',
                        'Fitness']
end
