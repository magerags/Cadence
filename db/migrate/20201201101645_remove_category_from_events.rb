class RemoveCategoryFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :category, null: false, foreign_key: true
    add_reference :events, :category, null: true, foreign_key: true
  end
end
