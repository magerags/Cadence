class AddUsernameToUserSettings < ActiveRecord::Migration[6.0]
  def change
    add_column :user_settings, :username, :string
  end
end
