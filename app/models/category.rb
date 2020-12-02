class Category < ApplicationRecord
  has_one :goal
  belongs_to :user

  # validates :name, uniqueness: true

  DEFAULT_CATEGORIES = ['Socialising',
                        'Eating',
                        'Hobby',
                        'Chores',
                        'Chilling',
                        'Coding',
                        'Gym',
                        'Running']
end
