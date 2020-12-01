class RemoveUserCategoryFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :user_categories, null: false, foreign_key: true
    add_reference :events, :user_categories, null: true, foreign_key: true
  end
end
