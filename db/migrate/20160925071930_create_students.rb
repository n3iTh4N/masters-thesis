class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :player_number
      t.integer :lobby_id
      t.integer :device_id
      t.integer :team_id
      t.boolean :playing
      t.integer :teacher_id
    end
  end
end
