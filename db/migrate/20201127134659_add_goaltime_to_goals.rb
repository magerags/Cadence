class AddGoaltimeToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :goaltime, :time
  end
end
