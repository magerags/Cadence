class AddUserCategoriesToGoals < ActiveRecord::Migration[6.0]
  def change
    add_reference :goals, :user_categories, null: false, foreign_key: true
  end
end
