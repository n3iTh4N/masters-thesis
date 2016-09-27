class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :game_id
      t.integer :lobby_id
    end
  end
end
