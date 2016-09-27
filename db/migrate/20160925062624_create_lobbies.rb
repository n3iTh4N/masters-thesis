class CreateLobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :lobbies do |t|
      ## gamedata
      t.string :name
      t.integer :teacher_id
      t.integer :player_count
      t.integer :game_id
      t.boolean :playing
    end
  end
end
