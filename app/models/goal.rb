class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :user_category, optional: true

  def get_category
    self.category.nil? ? UserCategory.find(self.user_categories_id) : self.category
  end

end
