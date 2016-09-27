class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :player_number
      t.integer :series
      t.integer :question_id
    end
  end
end
