class AddQuestioncountToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :questioncount, :integer
  end
end
