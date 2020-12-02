class RemoveCategoryFromGoals < ActiveRecord::Migration[6.0]
  def change
    remove_reference :goals, :category, null: false, foreign_key: true
    add_reference :goals, :category, null: true, foreign_key: true
  end
end
