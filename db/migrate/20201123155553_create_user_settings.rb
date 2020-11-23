class CreateUserSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.time :bed_time
      t.time :wake_time
      t.time :work_start
      t.time :work_end

      t.timestamps
    end
  end
end
