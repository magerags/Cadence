class AddNameToUserSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :user_settings, :name, :string
  end
end
