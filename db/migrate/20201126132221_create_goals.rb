class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :user_settings, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.time :goal

      t.timestamps
    end
  end
end
