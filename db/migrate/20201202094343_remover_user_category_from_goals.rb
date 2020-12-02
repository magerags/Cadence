class RemoverUserCategoryFromGoals < ActiveRecord::Migration[6.0]
  def change
    remove_reference :goals, :user_categories, null: false, foreign_key: true
  end
end
