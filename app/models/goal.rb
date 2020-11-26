class Goal < ApplicationRecord
  belongs_to :user_settings
  belongs_to :category
end
