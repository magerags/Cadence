class DropTableUserCategories < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_categories
  end
end
