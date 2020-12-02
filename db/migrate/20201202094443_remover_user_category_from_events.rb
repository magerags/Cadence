class RemoverUserCategoryFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :user_categories, null: false, foreign_key: true
  end
end
