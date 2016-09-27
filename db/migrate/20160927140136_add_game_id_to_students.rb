class AddGameIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :game_id, :integer
  end
end
