class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :repeatable
      t.datetime :starting_time
      t.datetime :ending_time

      t.timestamps
    end
  end
end
