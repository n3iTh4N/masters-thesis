class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :number_of_teams
      t.integer :players_per_team
      t.boolean :playing
    end
  end
end
